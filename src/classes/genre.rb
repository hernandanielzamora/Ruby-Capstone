require_relative 'item'

class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @int = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    return unless item.instance_of?(Item) && @items.include?(item)

    @items << item
    item.insert_genre(self)
  end
end
