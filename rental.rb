require './person'
require './book'
class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end

  def books=(book)
    @book = book
    book.rentals.push(book) unless book.rentals.include?(book)
  end

  def persons=(person)
    person.rentals.push(person) unless person.rentals.include?(person)
  end
end
