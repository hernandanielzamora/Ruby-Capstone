require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre, author, source, label, publish_date, publisher, cover_state)
    super(genre, author, source, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?()
    super || @cover_state == 'bad' ? true : false
  end

  def to_json(*args)
    {
      genre: @genre,
      author: @author,
      source: @source,
      label: @label,
      publish_date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['genre', 'author', 'source'])
  end
end
