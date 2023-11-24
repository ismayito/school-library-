require_relative '../rental'
require_relative '../book'
require 'json'

describe Rental do
  let(:person) { Person.new(25, 'John Doe') }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }

  describe '#initialize' do
    it 'initializes a new Rental object with default date if not specified' do
      rental = Rental.new
      expect(rental.date).to eq('Date not specified')
    end

    it 'initializes a new Rental object with the provided date' do
      rental = Rental.new('2023-11-30')
      expect(rental.date).to eq('2023-11-30')
    end
  end

  describe '#person=' do
    it 'assigns a person to the rental and adds the rental to the person\'s list' do
      rental = Rental.new
      rental.person = person

      expect(rental.person).to eq(person)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#book=' do
    it 'assigns a book to the rental and adds the rental to the book\'s list' do
      rental = Rental.new
      rental.book = book

      expect(rental.book).to eq(book)
      expect(book.rentals).to include(rental)
    end
  end

  describe '#to_json' do
    it 'converts the rental object to a JSON representation' do
      rental = Rental.new('2023-11-30')
      rental.person = person
      rental.book = book

      json_representation = {
        person_id: person.id,
        book_title: book.title,
        book_author: book.author,
        date: '2023-11-30'
      }.to_json

      expect(rental.to_json).to eq(json_representation)
    end
  end
end
