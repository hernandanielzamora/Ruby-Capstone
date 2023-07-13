require_relative './item'
require 'date'
require_relative './modules/date_diffrence'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, author, source, label, publish_date, multiplayer, last_played_at)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def to_json(*args)
    {
      genre: @genre,
      author: @author,
      source: @source,
      label: @label,
      publish_date: @publish_date,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['genre', 'author', 'source'])
  end

  private

  def can_be_archived?()
    super && input_date(@last_played_at) > 2 ? true : false
  end
end
