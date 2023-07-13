require_relative '../src/game'

describe Game do
  context 'Test Game class and its methods' do
    before(:each) do
      genre = { id: 384, name: 'Action', items: [] }
      author = { id: 572, first_name: 'Ndorrh', last_name: 'oswald beu', items: [] }
      source = { id: 76, name: 'Online shop', items: [] }
      label = { id: 119, title: 'Gift', color: 'Yellow', items: [] }
      publish_date = '10/10/2011'
      multiplayer = 'yes'
      last_played_at = '10/12/2019'
      @game = Game.new(genre, author, source, label, publish_date, multiplayer, last_played_at)
    end

    it 'should be able to acces title in Label object' do
      expect(@game.label[:title]).to eq 'Gift'
    end

    it 'Returns the instance of class' do
      expect(@game).to be_instance_of Game
    end

    it 'Return an empty array' do
      expect(@game.genre[:items]).to eql []
    end

    it 'Return true if publish date is older than 10 years and Last played date is older than 2years' do
      expect(@game.move_to_archive).to eql true
    end
  end
end
