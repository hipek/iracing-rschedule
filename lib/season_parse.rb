class SeasonParse < Struct.new(:file)
  def read_file
    `./node/season-parser #{file}`
  end

  def to_json
    JSON.parse read_file
  end
end
