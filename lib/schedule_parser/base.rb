class ScheduleParser::Base < Struct.new(:file)
  attr_accessor :season, :license, :race_type, :cars

  KEYWORDS = [
    'Season',
    'Week',
    'Class Series',
    'ROAD',
    'OVAL'
  ]
  MINS_LAPS  = /(\d{1,3})\s(laps|mins)/
  NIGHT_RACE = 'Night race'
  BLACKLISTED_WORDS = [
    'Local enforced cautions',
    'Local advisory cautions',
    'Single file', ',',
    'Double file', 'course cautions',
    'Cautions disabled',
    NIGHT_RACE
  ]

  def open_file(opts='rb')
    path = if file.respond_to?(:path)
      file.path
    else
      file
    end
    File.open(path, opts) do |io|
      yield io
    end if File.exists? path
  end

  def parse_date(str)
    Date.parse str
  end

  def mins_laps(str)
    str =~ MINS_LAPS
    "#{$1} #{$2}"
  end

  def series
    [].tap do |result|
      read do |ser|
        result << ser
      end
    end
  end

  def clear(text)
    BLACKLISTED_WORDS.each do |word|
      text.gsub!(word, ' ')
    end
    text.squeeze(' ').strip
  end

  def set_season(name)
    self.season = ScheduleParser::SeriesSeason.new name, []
    season.season_name = @season_name
    season.race_type = race_type
    season.license = license
    @season_name ||= season.season_name
  end
end
