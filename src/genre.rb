class Genre
  attr_accessor :name, :items

  def initialize(name)
    @id = Random.rand(301..500)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end

  def to_json(*args)
    {
      id: @id,
      name: @name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['id', 'name'])
  end
end
