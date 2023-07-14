require_relative '../src/classes/music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('2003-07-13', 'No', 'Fullmoon')
  end

  describe '#new' do
    it 'Creates a new music album' do
      expect(@music_album).to be_instance_of(MusicAlbum)
    end
  end

  describe '#can_be_archived?' do
    it 'Return true if album age > 10years' do
      expect(@music_album.can_be_archived?).to be_truthy
    end

    it 'return true if music album is on spotify' do
      music_album = MusicAlbum.new('2021-1-1', 'Yes', 'Fullmoon')
      expect(music_album.can_be_archived?).to be_truthy
    end

    it 'returns false if album age < 10yrs and album is not on spotify' do
      music_album = MusicAlbum.new('2021-1-1', 'No', 'Fullmoon')
      expect(music_album.can_be_archived?).to be_falsy
    end
  end

  describe '#add_item' do
    it 'Adds a new item to the music album' do
      expect(@music_album.title).to include('Fullmoon')
    end
  end
end
