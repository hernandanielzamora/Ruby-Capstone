require_relative '../src/classes/game'
require_relative '../src/classes/author'

RSpec.describe Game do
  let(:author) { Author.new('Jhon', 'Doe') }
  let(:game) { Game.new('World of Warcraft', true, '2001-06-20', '2019-01-01') }

  context 'When initialized' do
    it 'Should have a publish date' do
      expect(game.publish_date).to eq(Date.parse('2001-06-20'))
    end

    it 'Should have a multiplayer' do
      expect(game.multiplayer).to eq(true)
    end
  end

  describe '#can_be_archived?' do
    context 'When an item can be archived' do
      it 'should override the method from the parent class' do
        expect(game.can_be_archived?).to eq(true)
      end

      it 'should return true if parent\'s method returns true AND if last_played_at is older than 2 years' do
        expect(game.can_be_archived?).to eq(true)
      end

      it 'should return false if parent\'s method returns false' do
        game = Game.new('Metal slug', false, '2001-09-09', '2023-02-02')
        expect(game.can_be_archived?).to eq(false)
      end
    end
  end
end
