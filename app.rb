require './person'
require './student'
require './rental'
require './book'
require './teacher'
require './create_rental'
require './create_book'
require './list_book'
require './list_people'
require './create_person'
require 'json'

class App
  attr_accessor :person, :books, :rentals

  def initialize
    @person = load_persons_from_json
    @books = load_books_from_json
    @rentals = load_rentals_from_json
  end
  puts 'Welcome to School Library Console App UI'

  def run
    print "Running the App... \n"
  end
  puts 'Choose an option to get started'

  def options_list
    puts ''
    puts '1: List all books'
    puts '2: List all people'
    puts '3: Create a person (teacher or student, not a plain Person).'
    puts '4: Create a book'
    puts '5: Create a rental'
    puts '6: List all rentals for a given person id.'
    puts '7: Exit the application'
  end

  # method to return a list of rentals
  def list_rental_for_a_person
    list_people_from_json
    print 'Enter person ID from the list above: '
    person_id = gets.chomp.to_i

    # Debugging statements
    puts "Input person_id: #{person_id}"
    @person.each { |p| puts "Person ID in array: #{p['id']}" }

    person = @person.find { |p| p['id'] == person_id }
    person_hashed = Person.new(person['age'], person['name'], id: person['id'])

    if person_hashed
      puts "Rentals for #{person_hashed.name}:"
      person_hashed.rentals.each do |rental|
        puts "  Book: #{rental.book.title}, Date: #{rental.date}"
      end
    else
      puts 'Person not found.'
    end
  end

  # method to return list of people from books.json file
  def list_people_from_json
    if @person.empty?
      print ' No person added yet ? Enter 3 to create a person'
      choose_option
    else
      puts 'List of all available people'
      @person.each do |person|
        # puts "[ @Id:[#{person.id}]  Name: #{person.name} Age: #{person.age} Class:#{person.class}]"
        if person.is_a?(Student)
          puts "[ @Id:[#{person.id}] Name: #{person.name} Age: #{person.age} Class:#{person.class}]"
        elsif person.is_a?(Teacher)
          # Handle the Teacher class
          puts "[ @Id:[#{person.id}] Name: #{person.name} Age: #{person.age} Specialization: #{person.specialization}]"
        else
          # Handle the hash case differently
          puts "[ @Id:[#{person['id']}] Name: #{person['name']} Age: #{person['age']} Class:#{person['class']}]"
        end
      end
    end
  end

  # method to stop the application
  def stop_application
    puts 'Exiting the application'
    exit
  end

  # method to load books from 'books.json'
  def load_books_from_json
    if File.exist?('books.json')
      json_data = File.read('books.json')
      JSON.parse(json_data)
    else
      []
    end
  end

  # method to enable a user enter an operation to perform an action or operation
  # rubocop:disable Metrics/CyclomaticComplexity
  def choose_option
    loop do
      option = gets.chomp.to_i
      case option
      when 1
        ListBook.new(@books, self).list_books
      when 2 then ListPeople.new(@person, self).list_people
      when 3 then CreatePerson.new(@person, self).create_person
      when 4 then CreateBook.new(@books, self).create_book
      when 5
        create_rental
        options_list
        choose_option
        break
      when 6 then list_rental_for_a_person
      when 7 then stop_application
      else
        handle_invalid_option
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
