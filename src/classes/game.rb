require 'json'
require_relative 'item'

# Represents a game item.
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, genre, author, multiplayer, last_played_at)
    super(id)
    @genre = genre
    @author = author
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    last_played_days_ago = (Date.today - @last_played_at).to_i
    last_played_days_ago >= 365 * 2
  end

  def self.load_games(filename)
    JSON.parse(File.read(filename), symbolize_names: true).map do |game_data|
      Game.new(nil, nil, nil, game_data[:multiplayer], Date.parse(game_data[:last_played_at]))
    end
  end

  def self.save_games(games, filename)
    games_data = games.map do |game|
      { multiplayer: game.multiplayer, last_played_at: game.last_played_at.to_s }
    end
    File.write(filename, JSON.pretty_generate(games_data))
  end
end
