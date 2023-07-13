require_relative '../src/classes/author'
require_relative '../src/classes/item'
require 'date'

describe Author do
  let(:author) { Author.new(1, 'Stephen', 'King') }
  let(:item) { Item.new(Date.today) }

  describe '#add_item' do
    it 'adds the item to the items collection' do
      author.add_item(item)
      expect(author.items).to include(item)
    end

    it "sets the author as the item's author" do
      author.add_item(item)
      expect(item.author).to eq(author)
    end
  end
end
