class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def new_rental(rental)
    @rentals << rental
    rental.book = self
  end

  def to_json(*args)
    {
      title: @title,
      author: @author,
      rentals: @rentals
    }.to_json(*args)
  end
end
