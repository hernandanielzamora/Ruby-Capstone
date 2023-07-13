class Author
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(501..700)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item
  end

  def to_json(*args)
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['id', 'first_name', 'last_name'])
  end
end
