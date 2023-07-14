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
end
