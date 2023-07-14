require_relative '../src/classes/book'

describe Book do
  before :each do
    @book = Book.new('2020/05/04', 'publisher', 'cover_state')
  end

  describe '#new' do
    it 'Creates a new book' do
      expect(@book).to be_instance_of(Book)
    end

    it 'Can settle cover_state' do
      @book.cover_state = 'bad'
      expect(@book.cover_state).to eq('bad')
    end
  end

  describe '#can_be_archived?' do
    it 'Return true if > 10years' do
      book = Book.new('2002/2/2', 'publisher', 'cover_state')
      expect(book.can_be_archived?).to be_truthy
    end
    it 'Return true if cover state is bad' do
      book = Book.new('2021/1/1', 'publisher', 'bad')
      expect(book.can_be_archived?).to be_truthy
    end
    it 'should return false if date is not older than 10 years and cover_state is not bad' do
      book = Book.new('2023/04/05', 'publisher', 'good')
      expect(book.can_be_archived?).to be_falsy
    end
  end
end
