require_relative '../src/music_album'
require_relative '../src/author'

describe Author do
  context 'Test Author class and its methods' do
    before(:each) do
      genre = { id: 384, name: 'Action', items: [] }
      source = { id: 76, name: 'Online shop', items: [] }
      publish_date = '10/10/2011'
      on_spotify = true
      @label = Label.new('Gift', 'pink')
      @author = Author.new('James', 'Ebu')
      @music = MusicAlbum.new(genre, @author, source, @label, publish_date, on_spotify)
    end

    it 'Returns the instance of class' do
      expect(@label).to be_instance_of Label
    end

    it 'check properties' do
      expect(@author.first_name).to eql 'James'
    end

    it 'Add item to array' do
      @author.add_item(@music)
      len = @author.items.length
      expect(len).to eql 2
    end
  end
end
