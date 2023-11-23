require './person'
require './book'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    if person.is_a?(Person)
      @person = person
      person.rentals << self
    end
    return unless book.is_a?(Book)

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

  def to_json(*args)
    {
      person_id: @person&.id, # Use safe navigation operator &. to avoid calling id on nil
      book_title: @book&.title,
      book_author: @book&.author,
      date: @date
    }.to_json(*args)
  end

  def self.load_rentals_from_json(persons, books)
    if File.exist?('rentals.json') && !File.empty?('rentals.json')
      json_data = File.read('rentals.json')
      json_array = JSON.parse(json_data)
      json_array.map do |rental_data|
        person = persons.find { |p| p.id == rental_data['person_id'] }
        book = books.find { |b| b.title == rental_data['book_title'] && b.author == rental_data['book_author'] }
        Rental.new(rental_data['date'], person, book)
      end
    else
      []
    end
  end
end
