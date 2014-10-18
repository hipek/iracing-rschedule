module ScheduleParser
  def parse(file)
    ext = File.extname(file)

    if ext =~ /\.txt/
      ScheduleParser::Txt.new(file)
    else
      ScheduleParser::Pdf.new(file)
    end
  end

  module_function :parse
end
