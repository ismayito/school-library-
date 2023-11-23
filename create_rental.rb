require './app'
require './book'
require './student'
require './teacher'
require './rental'

def create_rental(app_instance)
  list_person(app_instance)
  print 'ID of person: (Choose "ID" from the above list)'
  person_id = gets.chomp.to_i

  # Find the person, whether it's an instance of Person or a hash
  person = app_instance.person.find do |p|
    if p.is_a?(Person)
      p.id == person_id
    else
      p['id'] == person_id
    end
  end

  # Use a more explicit condition to check if person is found
  if person
    puts "Found person: #{person.inspect}"
  else
    puts 'Error: Person not found.'
    return # Exit the method if person is not found
  end

  list_book(app_instance)
  print 'book title: (Choose book from the above list)'
  book_title = gets.chomp

  # Find the book, whether it's an instance of Book or a hash
  book = app_instance.books.find do |b|
    if b.is_a?(Book)
      b.title == book_title
    else
      b['title'] == book_title
    end
  end

  print 'Enter rental date: '
  rental_date = gets.chomp

  if person.is_a?(Hash)
    rental = Rental.new(rental_date, person, book)
    person['rentals'] << rental
    app_instance.rentals << rental
    puts 'Rental created successfully.'
  else
    puts 'Error: Person not found.'
  end
  app_instance.options_list
  app_instance.choose_option
end

def list_person(app_instance)
  if app_instance.person.empty?
    puts 'No people added yet. Enter 3 to create a person.'
    app_instance.choose_option
  else
    puts 'List of all available people:'
    app_instance.person.each do |person|
      if person.is_a?(Person)
        puts "[ID: #{person.id.to_i}] Name: #{person.name} Age: #{person.age} Class: #{person.class}"
      else
        puts "[ID: #{person['id'].to_i}] Name: #{person['name']} Age: #{person['age']} Class: #{person['class']}"
      end
    end
  end
end

def list_book(app_instance)
  if app_instance.books.empty?
    puts 'No books added yet. Enter 4 to create a new book.'
    app_instance.choose_option
  else
    puts 'List of all available books:'
    app_instance.books.each do |book|
      if book.is_a?(Book)
        puts "Book: #{book.title} Author: #{book.author}"
      else
        puts "Book: #{book['title']} Author: #{book['author']}"
      end
    end
  end
end
