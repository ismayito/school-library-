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

class App
  attr_accessor :person, :books, :rentals

  def initialize
    @person = []
    @books = []
    @rentals = []
  end
  puts 'welcome to school library console app UI'

  def run
    print "Running the app \n"
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
    if @person.empty?
      print ' No person added yet ? Enter 3 to create a person'
      choose_option
    else
      puts 'List of all available people'
      @person.each do |person|
        puts "[ @Id:[#{person.id}] Name: #{person.name} Age: #{person.age} Class:#{person.class}]"
      end
    end
    print 'Enter person ID from the list above '
    person_id = gets.chomp.to_i
    person = @person.find { |p| p.id == person_id }
    if person
      puts "Rentals for #{person.correct_name}:"
      person.rentals.each do |rental|
        puts "  Book: #{rental.book.title}, Date: #{rental.date}"
      end
    else
      puts 'Person not found.'
    end
  end

  # method to stop the application
  def stop_application
    puts 'Exiting the application'
    exit
  end

  # method to enable a user enter an operation to perform an action or operation
  # rubocop:disable Metrics/CyclomaticComplexity
  def choose_option
    option = gets.chomp.to_i

    case option
    when 1 then ListBook.new(@books, self).list_books
    when 2 then ListPeople.new(@person, self).list_people
    when 3 then CreatePerson.new(@person, self).create_person
    when 4 then CreateBook.new(@books, self).create_book
    when 5 then create_rental
    when 6 then list_rental_for_a_person
    when 7 then stop_application
    else
      handle_invalid_option
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
