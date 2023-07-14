require_relative '../src/classes/genre'

describe Genre do
  before :each do
    @genre = Genre.new('Thriller')
    @item = Item.new('2020/05/05')
  end

  describe '#new' do
    it 'Creates a new Genre' do
      expect(@genre).to be_instance_of(Genre)
    end
  end

  describe '#add_item' do
    it 'Adds a new item to the genre' do
      @genre.add_item(@item)
      expect(@genre.name).to include('Thriller')
    end
  end
end
