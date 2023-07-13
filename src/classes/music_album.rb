require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :id, :title
  attr_reader :publish_date

  def initialize(publish_date, on_spotify, title)
    super(publish_date)
    @id = Random.rand(1...1000)
    @on_spotify = on_spotify
    @title = title
  end

  private

  def can_be_archived?
    super && on_spotify?
  end
end
