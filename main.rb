require_relative 'src/handlers/book_handler'
require_relative 'src/handlers/label_handler'
require_relative 'src/handlers/json_handler'
require_relative 'src/handlers/music_genre_handler'

class Main
  def initialize
    @book_handler = BookHandler.new
    @label_handler = LabelHandler.new
    @music_album_handler = MusicAlbumHandler.new
    @genre_handler = GenreHandler.new
    @storage = HandleJson.new('./JSON/')
    @book_handler.book_json = @storage.load_from_json('books')
    @label_handler.label_json = @storage.load_from_json('labels')
    @label_handler.init_labels_list
    @music_album_handler.music_album_json = @storage.load_from_json('music_albums')
    @genre_handler.genre_json = @storage.load_from_json('genres')
    @genre_handler.init_genres_list
    puts '----------------------------------------'
    puts 'Be welcomed to catalog all my things'
    puts
    display_options
    chosen = get_input('Select an option: ').to_i
    selected_option(chosen)
  end

  # Saving the data in JSON files
  def storage_data
    book_json = @book_handler.book_json
    label_json = @label_handler.label_json
    music_album_json = @music_album_handler.music_album_json
    genre_json = @genre_handler.genre_json

    @storage.storage_in_json('books', book_json)
    @storage.storage_in_json('labels', label_json)
    @storage.storage_in_json('music_albums', music_album_json)
    @storage.storage_in_json('genres', genre_json)
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

  # options = For when cases, take this as reference
  # 1 => :list_book,
  # 2 => :list_music_albums,
  # 3 => 'option_3',
  # 4 => :list_genres,
  # 5 => :list_labels,
  # 6 => 'option_6',
  # 7 => :add_book,
  # 8 => :add_music_album,
  # 9 => 'option_9',
  # 10 => :exit_program
  
  # rubocop: disable Metrics/CyclomaticComplexity
  def selected_option(chosen)
    loop do
      case chosen
      when 1
        @book_handler.list_book
        puts ''
      when 2
        @music_album_handler.list_music_album
      when 4
        @genre_handler.list_genres
      when 5
        @label_handler.list_labels
      when 7
        @book_handler.add_book(@label_handler)
      when 8
        @music_album_handler.add_music_album(@genre_handler)
      when 10
        puts 'Thank you. Exiting program'
        storage_data
        break
      else
        puts 'Invalid option. Please select a number from the menu'
      end
      display_options
      chosen = get_input('Select an option:').to_i
    end
    # rubocop: enable Metrics/CyclomaticComplexity
  end
end

Main.new
