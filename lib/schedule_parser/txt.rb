class ScheduleParser::Txt < ScheduleParser::Base
  def lines(&blk)
    open_file('r') do |io|
      io.each(&blk)
    end
  end

  def read(&blk)
    last = ''

    lines do |line|
      if KEYWORDS.any?{|k| line.match(k)}
        last = line
        read_line(line, &blk)
      elsif mins_laps(line).present?
        season.tracks.last[2] = mins_laps(line)
      elsif last.match /Season/
        self.cars = line.strip.split(',')
        last = ''
      end
    end
  end

  def read_line(line)
    if line.match /Class Series/
      self.license = line.strip.split('Class').first.strip
      return
    end
    if line.match /ROAD|OVAL/
      self.race_type = line.strip
      return
    end

    night = !!line.match(NIGHT_RACE)
    list = parse_week(line)

    if list.size > 1
      season.cars ||= cars.map(&:strip)
      season.tracks << [
        parse_date(list.first),
        list.last,
        '',
        night
      ]
    else
      yield season if season.present?
      set_season(list.first)
    end
  end

  DATE = /\((\d{4}-\d{2}-\d{2})\)/

  def parse_week(line)
    week = clear(line.split(',').first)
    track = week.split(DATE).last.try(:strip)
    week =~ DATE
    date = $1
    [date, track].compact
  end
end
