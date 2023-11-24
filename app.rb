require './student'
require './teacher'
require './book'
require './rental'
require './load_json'
require './display'
require './rental_operations'
require 'date'
require 'json'

class App
  attr_reader :people

  def initialize
    @people = []
    @books = []
    @rental = Rental.new
    @saved_people = load_people_data
    @saved_books = load_books_data
    @saved_rentals = load_rentals_data
  end

  def show_available_books
    all_books = @saved_books + @books
    all_books.select do |book|
      puts "Title: \"#{book['title']}\", Author: #{book['author']}" if book.instance_of?(Hash)
      puts "Title: \"#{book.title}\", Author: #{book.author}" if book.instance_of?(Book)
    end
  end

  def show_available_people
    all_persons = @saved_people + @people
    all_persons.select do |person|
      if person.instance_of?(Student) || person.instance_of?(Teacher)
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "[#{person['class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    end
  end

  def add_person_to_list
    print 'Do you want to create a new person a student?(1) or a teacher?(2)? [Enter number]: '
    num = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    if num == '1'
      person = Student.new(age, nil, name)
      print 'Has parent permission [Y/N]: '
      user_input = gets.chomp
      person.parent_permission = false if user_input == 'N'
      @people << person
    elsif num == '2'
      print 'specialization: '
      user_input = gets.chomp
      person = Teacher.new(age, user_input, name)
      @people << person
    end
  end

  def add_book_to_list
    print 'Enter Book Title: '
    title = gets.chomp
    print 'Enter Book Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
  end

  def add_rental_to_list
    puts 'book type: (Choose book from the above list by number not ID)'
    all_books = @saved_books + @books
    print_rentals(all_books)

    active_book = all_books[gets.chomp.to_i]

    borrowed_items(active_book, @rental)
    puts ' '

    puts 'Pick a person from the list using their assigned number, not their ID.'
    all_persons = @saved_people + @people
    show_rental_picks(all_persons)
    chosen_id = all_persons[gets.chomp.to_i]

    book_borrower(chosen_id, @rental)
    puts ' '

    print 'Enter rental date the format YYYY-MM-DD: '
    @rental.date = Date.parse(gets.chomp)
    @saved_rentals << @rental
  end

  def display_person_rentals
    puts 'These are the Available IDs: '
    available_ids = @saved_rentals.map { |rental| rental['person_id'] }.uniq
    puts available_ids.join(', ')
    print 'Enter person ID from the list: '
    user_input = gets.chomp.to_i
    picked_borrow = book_borrowed_by_person(@saved_rentals, user_input)

    if picked_borrow.empty?
      puts 'Rentals: '
    else
      print_picked_borrows(picked_borrow)
    end
  end

  def load_to_json
    @saved_people += @people
    File.write('person.json', JSON.generate(@saved_people).to_s)

    @saved_books += @books
    File.write('books.json', JSON.generate(@saved_books).to_s)

    File.write('rentals.json', JSON.generate(@saved_rentals).to_s)
    puts 'Exiting the application...'
  end
end
