require 'json'

# Represents an author of items.
class Author
  attr_reader :id, :first_name, :last_name
  attr_accessor :items

  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def self.load_authors(filename)
    JSON.parse(File.read(filename), symbolize_names: true).map do |author_data|
      Author.new(author_data[:id], author_data[:first_name], author_data[:last_name])
    end
  end

  def self.save_authors(authors, filename)
    authors_data = authors.map do |author|
      { id: author.id, first_name: author.first_name, last_name: author.last_name }
    end
    File.write(filename, JSON.dump(authors_data))
  end
end
