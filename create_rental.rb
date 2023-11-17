require './book'
require './student'
require './teacher'
require './rental'

def create_rental
  list_person
  print 'ID of person: (Choose "ID" from the above list)'
  person_id = gets.chomp.to_i
  person = @person.find { |p| p.id == person_id }
  list_book
  print 'book type: (Choose book from the above list)'
  book_title = gets.chomp
  book = @books.find { |b| b.title == book_title }
  print 'Enter rental date: '
  rental_date = gets.chomp
  rental = Rental.new(rental_date, person, book)
  @rentals << rental
  puts 'Rental created successfully.'
end

def list_person
  if @person.empty?
    puts 'No people added yet. Enter 3 to create a person.'
    choose_option
  else
    puts 'List of all available people:'
    @person.each { |person| puts "[ID: #{person.id}] Name: #{person.name} Age: #{person.age} Class: #{person.class}" }
  end
end

def list_book
  if @books.empty?
    puts 'No books added yet. Enter 4 to create a new book.'
    choose_option
  else
    puts 'List of all available books:'
    @books.each { |book| puts "Book: #{book.title} Author: #{book.author}" }
  end
end
