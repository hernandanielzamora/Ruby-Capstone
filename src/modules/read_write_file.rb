require 'json'

def read_json_file(file_name)
  if File.file?(file_name) && !File.read(file_name).nil?
    data = File.open(file_name, 'r')
    data_json = JSON.parse(data.read)
    data.close
    data_json
  else
    '404'
  end
end

def write_json_file(file_name, data)
  File.write(file_name, JSON.pretty_generate(data))
end
