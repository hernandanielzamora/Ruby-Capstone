require_relative 'item'
require 'date'

class Games < Item
  attr_reader :id, :multiplayer, :last_played_at, :publish_date, :game_name
  attr_accessor :archived

  def initialize(game_name, multiplayer, publish_date, last_played_at)
    super(publish_date)
    @id = Random.rand(1...1000)
    @last_played_at = Date.parse(last_played_at)
    @game_name = game_name
    @multiplayer = multiplayer
    @archived = can_be_archived?
  end

  def can_be_archived?
    super && (Date.today - @last_played_at).to_i > (2 * 365)
  end
end
