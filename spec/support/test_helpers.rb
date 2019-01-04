require "json"

module TestHelpers
  def parse_json(file_name)
    JSON.parse(File.read(file_name))
  end
end
