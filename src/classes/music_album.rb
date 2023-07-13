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

  def can_be_archived?
    super || on_spotify?(@on_spotify)
  end

  private

  def on_spotify?(on_spotify)
    on_spotify = on_spotify.downcase
    on_spotify == 'yes'
  end
end
