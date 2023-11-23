class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end

  def to_json(*args)
    {
      title: @title,
      author: @author,
      rentals: @rentals
    }.to_json(*args)
  end
end
