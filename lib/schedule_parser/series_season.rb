class ScheduleParser::SeriesSeason < Struct.new(:name, :tracks, :cars)
  attr_accessor :season_name, :license, :race_type

  def series_name
    name.gsub(season_name, ' ').
    squeeze(' ').
    gsub(/\-\s?\-/,'-').
    strip.chomp('-').strip
  end

  def season_name
    @season_name ||= name.split(' - ').last.strip
  end
end
