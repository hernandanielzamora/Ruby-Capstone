require_relative '../classes/author'

class AuthorHandler
  attr_accessor :author_list, :author_json

  def initialize
    @authors_list = []
    @author_json = []
  end

  def author_to_json(author)
    {
      'id' => author.id,
      'first_name' => author.first_name,
      'last_name' => author.last_name
    }
  end

  # Fills the authors array with the information hold in the json
  def init_authors_list
    return unless author_json.empty?

    @author_json.each do |author|
      author = author.new(author[:first_name], author[:last_name])
      author_list.push(author)
    end
  end

  def list_authors
    puts ''
    puts 'Here are all your authors... '
    puts ''
    if @author_json.empty?
      puts 'No authors found'
      puts '----------------------------------------'
    else
      @author_json.each_with_index do |author, i|
        puts "#{i + 1} | #{author['first_name']} #{author['last_name']}"
      end
      puts ''
    end
    puts '----------------------------------------'
    puts ''
  end

  def add_author(item)
    puts ''
    puts 'Please insert the following data for creating a author: '
    puts ''
    print 'Author first name: '
    author_first_name = gets.chomp
    print 'Author last name: '
    author_last_name = gets.chomp
    author = Author.new(author_first_name, author_last_name)
    @authors_list << author
    @author_json << author_to_json(author)
    author.add_item(item)
    puts ''
    puts 'Game added!'
    puts '----------------------------------------'
  end
end
