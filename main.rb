require_relative 'src/handlers/book_handler'
require_relative 'src/handlers/label_handler'
require_relative 'src/handlers/json_handler'
require_relative 'src/handlers/music_genre_handler'
require_relative 'src/handlers/games_handler'
require_relative 'src/handlers/author_handler'

class Main
  def initialize
    @book_handler = BookHandler.new
    @label_handler = LabelHandler.new
    @music_album_handler = MusicAlbumHandler.new
    @genre_handler = GenreHandler.new
    @games_handler = GamesHandler.new
    @author_handler = AuthorHandler.new
    @storage = HandleJson.new('./JSON/')
    @book_handler.book_json = @storage.load_from_json('books')
    @label_handler.label_json = @storage.load_from_json('labels')
    @music_album_handler.music_album_json = @storage.load_from_json('music_albums')
    @genre_handler.genre_json = @storage.load_from_json('genres')
    @games_handler.games_json = @storage.load_from_json('games')
    @author_handler.author_json = @storage.load_from_json('authors')
    @label_handler.init_labels_list
    @genre_handler.init_genres_list
    @author_handler.init_authors_list
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
    games_json = @games_handler.games_json
    author_json = @author_handler.author_json

    @storage.storage_in_json('books', book_json)
    @storage.storage_in_json('labels', label_json)
    @storage.storage_in_json('music_albums', music_album_json)
    @storage.storage_in_json('genres', genre_json)
    @storage.storage_in_json('games', games_json)
    @storage.storage_in_json('authors', author_json)
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

  def selected_option(chosen)
    options = {
      1 => { handler: @book_handler, method: :list_book },
      2 => { handler: @music_album_handler, method: :list_music_album },
      3 => { handler: @games_handler, method: :list_games },
      4 => { handler: @genre_handler, method: :list_genres },
      5 => { handler: @label_handler, method: :list_labels },
      6 => { handler: @author_handler, method: :list_authors },
      7 => { handler: @book_handler, method: :add_book, params: [@label_handler] },
      8 => { handler: @music_album_handler, method: :add_music_album, params: [@genre_handler] },
      9 => { handler: @games_handler, method: :add_games, params: [@author_handler] },
      10 => :exit_program
    }

    loop do
      if options.key?(chosen)
        option = options[chosen]
        if option == :exit_program
          puts 'Thank you. Exiting program'
          storage_data
          break
        else
          handle_option(option)
        end
      else
        puts 'Invalid option. Please select a number from the menu'
      end

      display_options
      chosen = get_input('Select an option:').to_i
    end
  end

  def handle_option(option)
    handler = option[:handler]
    method = option[:method]
    params = option[:params] || []
    handler.send(method, *params)
    puts ''
  end
end

Main.new
