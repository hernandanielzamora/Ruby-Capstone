require_relative '../src/classes/label'

describe Label do
  before :each do
    @label = Label.new('title', 'color')
    @item = Item.new('2020/05/05')
  end

  describe '#new' do
    it 'Creates a new label' do
      expect(@label).to be_instance_of(Label)
    end
  end

  describe '#add_item' do
    it 'Adds an item to a label' do
      @label.add_item(@item)
      expect(@label.items).to include(@item)
    end

    it 'Does not add another item besides the @item' do
      @label.add_item('item')
      expect(@label.items.length).to eq(0)
    end

    it 'Adds the label to the item' do
      @label.add_item(@item)
      expect(@item.label).to be(@label)
    end
  end
end
