class ScheduleParser::Pdf < ScheduleParser::Base
  def pages
    open_file do |io|
      r = PDF::Reader.new(io)
      r.pages.each do |page|
        yield page
      end
    end
  end

  def lines
    last = ''
    pages do |page|
      page.text.split(/\n/).each do |line|
        next if line.blank?
        if KEYWORDS.any?{|k| line.match(k)}
          last = line
          yield line.strip
        elsif last.match /Season/
          self.cars = line.strip.split(',')
          last = ''
        end
      end
    end
  end

  def read
    lines do |line|
      if line.match /Class Series/
        self.license = line.strip.split('Class').first.strip
        next
      end
      if line.match /ROAD|OVAL/
        self.race_type = line.strip
        next
      end

      night = !!line.match(NIGHT_RACE)
      rows  = line.split(/[\s]{2,}/)

      if rows.size > 1
        season.cars ||= cars.map(&:strip)
        season.tracks << [
          parse_date(rows[0]),
          clear(rows[1]),
          clear(mins_laps(rows[-1])),
          night
        ]
      else
        yield season if season.present?
        set_season(rows.first)
      end
    end
  end
end
