module ScheduleParser
  def parse(file)
    ext = File.extname(
      if file.respond_to?(:original_filename)
        file.original_filename
      else
        file
      end)

    if ext =~ /\.txt/
      ScheduleParser::Txt.new(file)
    else
      ScheduleParser::Pdf.new(file)
    end
  end

  module_function :parse
end
