require_relative '../classes/book'
require_relative 'label_handler'

class BookHandler
  attr_accessor :book_list, :book_json

  def initialize
    @book_list = []
    @book_json = []
  end

  def book_to_json(book)
    {
      'id' => book.id,
      'publisher' => book.publisher,
      'cover_state' => book.cover_state,
      'publish_date' => book.publish_date
    }
  end

  def list_book
    if book_json.empty?
      puts 'There are no books in the list'
    else
      puts ''
      puts 'Books: '
      puts ''
      @book_json.each_with_index do |book, i|
        id = book['id']
        publisher = book['publisher']
        cover_state = book['cover_state']
        publish_date = book['publish_date']
        puts "#{i + 1}|ID: #{id}- Publisher: #{publisher}- Cover State: #{cover_state}- Publish Date: #{publish_date}"
      end
      puts ''
    end
    puts '----------------------------------------'
  end

  def add_book(label_options)
    puts 'Please insert the following information!'
    puts ''
    print 'Publisher`s name: '
    book_publisher = gets.chomp
    print 'Cover state: '
    book_cover_state = gets.chomp
    print 'Publish date (YYYY-MM-DD): '
    book_date = gets.chomp
    # Validate the date format
    if book_date.match(/\A\d{4}-\d{2}-\d{2}\z/)
      book = Book.new(book_date, book_publisher, book_cover_state)
      @book_list.push(book)
      @book_json.push(book_to_json(book))
      label_options.add_label(book)
    else
      puts 'Invalid date format. Please use the format YYYY-MM-DD.'
    end
    puts ''
  end
end
