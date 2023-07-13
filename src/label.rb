class Label
  attr_accessor :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(100..300)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*args)
    {
      id: @id,
      title: @title,
      color: @color
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['id', 'title', 'color'])
  end
end
