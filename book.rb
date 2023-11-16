class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(book_rented)
    @rentals.push(book_rented)
    book_rented.book = self
  end
end
