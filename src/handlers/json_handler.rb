require 'json'

class HandleJson
  def initialize(path)
    @path = path
  end

  def storage_in_json(name_class, object)
    File.write("#{@path}#{name_class}.json", JSON.pretty_generate(object))
  end

  def load_from_json(name_class)
    path_to_file = "#{@path}#{name_class}.json"

    return [] unless File.exist?(path_to_file)

    content = File.read(path_to_file)
    JSON.parse(content)
  rescue StandardError => e
    puts "Error loading JSON file: #{e.message}"
    []
  end
end
