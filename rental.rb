class Rental
  # Attribute readers for person and book, and an attribute accessor for date
  attr_reader :person, :book
  attr_accessor :date

  # Constructor method for initializing a new Rental object with an optional date parameter
  def initialize(date = 'Date not specified')
    @date = date
  end

  # Setter method for assigning a person to the rental and adding the rental to the person's list
  def person=(person)
    @person = person
    # Add the rental to the person's list of rentals if not already included
    person.rentals << self unless person.rentals.include?(self)
  end

  # Setter method for assigning a book to the rental and adding the rental to the book's list
  def book=(book)
    @book = book
    # Add the rental to the book's list of rentals if not already included
    book.rentals << self unless book.rentals.include?(self)
  end

  # Method to convert the object to a JSON representation
  def to_json(*args)
    {
      person_id: @person.id,
      book_title: @book.title,
      book_author: @book.author,
      date: @date
    }.to_json(*args)
  end
end
