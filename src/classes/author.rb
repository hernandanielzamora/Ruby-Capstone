class Author
  attr_accessor :name, :books
  
  def initialize(name)
    @name = name
    @books = []
  end

  def write_book(title, genre)
    book = Book.new(title, genre)
    @books << book
    book
  end
end

class Book
  attr_accessor :title, :genre
  
  def initialize(title, genre)
    @title = title
    @genre = genre
  end
end