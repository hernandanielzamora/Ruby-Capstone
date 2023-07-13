require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre, author, source, label, publish_date, on_spotify)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  def to_json(*args)
    {
      genre: @genre,
      author: @author,
      source: @source,
      label: @label,
      publish_date: @publish_date,
      on_spotify: @on_spotify
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['genre', 'author', 'source'])
  end

  private

  def can_be_archived?()
    super && @on_spotify ? true : false
  end
end
