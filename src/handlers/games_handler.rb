require_relative '../classes/game'
require_relative 'author_handler'

class GamesHandler
  attr_accessor :games_list, :games_json

  def initialize
    @games_list = []
    @games_json = []
  end

  def games_to_json(games)
    {
      'id' => games.id,
      'game_name' => games.game_name,
      'multiplayer' => games.multiplayer,
      'publish_date' => games.publish_date,
      'last_played_at' => games.last_played_at
    }
  end

  def list_games
    if games_json.empty?
      puts 'There are no games in the list'
    else
      puts ''
      puts 'Games: '
      puts ''
      @games_json.each_with_index do |games, i|
        id = games['id']
        name = games['game_name']
        multiplayer = games['multiplayer']
        publish_date = games['publish_date']
        last_played_at = games['last_played_at']
        puts "#{i + 1}|ID: #{id} - name: #{name} - Cover State: #{multiplayer} - Publish Date: #{publish_date} - Last Played At: #{last_played_at}"
      end
      puts ''
    end
    puts '----------------------------------------'
    puts ''
  end

  def add_games(author_handler)
    puts ''
    puts 'Please insert the following information!'
    puts ''
    print 'Game`s name: '
    games_name = gets.chomp
    print 'Multiplayer game? (true/false): '
    games_multiplayer = gets.chomp
    print 'Publish date (YYYY-MM-DD): '
    games_date = gets.chomp
    print 'Last time you played it? (YYYY-MM-DD): '
    games_last_played_at = gets.chomp
    # Validate the date format
    if games_date.match(/\A\d{4}-\d{2}-\d{2}\z/)
      games = Game.new(games_name, games_multiplayer, games_date, games_last_played_at)
      @games_list.push(games)
      @games_json.push(games_to_json(games))
      author_handler.add_author(games)
    else
      puts 'Invalid date format. Please use the format YYYY-MM-DD.'
    end
    puts ''
  end
end
