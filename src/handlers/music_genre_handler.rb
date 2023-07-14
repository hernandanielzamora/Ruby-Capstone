require_relative '../classes/music_album'
require_relative '../classes/genre'

class MusicAlbumHandler
  attr_accessor :music_album_list, :music_album_json

  def initialize
    @music_album_list = []
    @music_album_json = []
  end

  def music_album_to_json(music_album)
    {
      'id' => music_album.id,
      'on_spotify' => music_album.on_spotify,
      'publish_date' => music_album.publish_date,
      'title' => music_album.title
    }
  end

  def list_music_album
    if music_album_json.empty?
      puts 'There are no music albums'
    else
      puts ''
      puts 'Music Albums: '
      puts ''
      @music_album_json.each_with_index do |music_album, i|
        id = music_album['id']
        on_spotify = music_album['on_spotify']
        publish_date = music_album['publish_date']
        title = music_album['title']
        puts "#{i + 1}|ID: #{id}- Title: #{title}- Published Date: #{publish_date}- On Spotify: #{on_spotify}"
      end
      puts ''
    end
    puts '-----------------------------------'
  end

  def add_music_album(genre_options)
    puts 'Please enter the music album details'
    puts ''
    print 'Music Album Title: '
    music_album_title = gets.chomp
    print 'Publish date (YYYY-MM-DD): '
    music_album_date = gets.chomp
    print 'On Spotify? (\'Yes/No\'): '
    on_spotify = gets.chomp

    if music_album_date.match(/\A\d{4}-\d{2}-\d{2}\z/)
      music_album = MusicAlbum.new(music_album_date, on_spotify, music_album_title)
      @music_album_list.push(music_album)
      @music_album_json.push(music_album_to_json(music_album))
      genre_options.add_genre(music_album)
    else
      puts 'Invalid date format. Please use the format YYYY-MM-DD.'
    end
    puts ''
  end
end

class GenreHandler
  attr_accessor :genre_list, :genre_json

  def initialize
    @genre_list = []
    @genre_json = []
  end

  def genre_to_json(genre)
    {
      'id' => genre.id,
      'name' => genre.name
    }
  end

  # Fills the labels array with the information hold in the json
  def init_genres_list
    return unless genre_json.empty?

    @genre_json.each do |genre|
      genre = Genre.new(genre[:name])
      genre_list.push(genre)
    end
  end

  def list_genres
    puts ''
    puts 'Here are all your genres... '
    puts ''
    if @genre_json.empty?
      puts 'No genres found'
      puts '----------------------------------------'
    else
      @genre_json.each_with_index do |genre, i|
        puts "#{i + 1} | #{genre['name']}"
      end
      puts ''
    end
    puts '----------------------------------------'
    puts ''
  end

  def add_genre(item)
    puts ''
    puts 'Please enter the genre details'
    puts ''
    print 'Genre name: '
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genre_list << genre
    @genre_json << genre_to_json(genre)
    genre.add_item(item)
    puts ''
    puts 'Music Album added!'
    puts '----------------------------------------'
  end
end
