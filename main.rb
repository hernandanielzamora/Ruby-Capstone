require_relative 'src/handlers/book_handler'
require_relative 'src/handlers/label_handler'
require_relative 'src/handlers/json_handler'

class Main
  def initialize
    @book_handler = BookHandler.new
    @label_handler = LabelHandler.new
    @storage = HandleJson.new('./JSON/')
    @book_handler.book_json = @storage.load_from_json('books')
    @label_handler.label_json = @storage.load_from_json('labels')
    @label_handler.init_labels_list
    puts '----------------------------------------'
    puts 'Be welcomed to cathalog all my things'
    puts
    display_options
    chosen = get_input('Select an option: ').to_i
    selected_option(chosen)
  end

  # Saving the data in JSON files
  def storage_data
    book_json = @book_handler.book_json
    label_json = @label_handler.label_json

    @storage.storage_in_json('books', book_json)
    @storage.storage_in_json('labels', label_json)
  end

  def display_options
    array_options = ['List all books', 'List all music albums', 'List of games',
                     'List all genres', 'List all labels', 'List all authors', 'Add a book',
                     'Add a music album', 'Add a game', 'Exit Program']
    puts 'Please select a valid option'
    puts '----------------------------------------'
    array_options.each_with_index do |option, index|
      puts "#{index + 1}| #{option}"
    end
    puts ''
  end

  def get_input(user_input)
    print user_input
    gets.chomp
  end

  def selected_option(chosen)
    options = {
      1 => :list_book,
      2 => 'option_2',
      3 => 'option_3',
      4 => 'option_4',
      5 => :list_labels,
      6 => 'option_6',
      7 => :add_book,
      8 => 'option_8',
      9 => 'option_9',
      10 => :exit_program
    }

    loop do
      if options.key?(chosen)
        method_name = options[chosen]
  
        case method_name
        when :list_book
          @book_handler.send(method_name)
          puts ''
        when :list_labels
          @label_handler.send(method_name)
        when :add_book
          @book_handler.send(method_name, @label_handler)
        when :exit_program
          puts 'Thank you. Exiting program'
          storage_data
          break
        else
          puts "Chosen: #{chosen}"
        end
      else
        puts 'Invalid option. Please select a number from the menu'
      end

      display_options
      chosen = get_input('Select an option:').to_i
    end
  end
end

Main.new
