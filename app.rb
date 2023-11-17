require './person'
require './student'
require './rental'
require './book'
require './teacher'
require './create_rental'

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

  # method to display a list of operations to a user can perfom
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

  # method to return list of books
  def list_books
    if @books.empty?
      puts 'No books added yet.'
      puts 'Choose 4 to add a book'
    else
      @books.each do |book|
        puts "Book: #{book.title}"
        puts "Author: #{book.author}"
      end
    end
    choose_option
  end

  # method to create a new book by the user
  def create_book
    puts 'Enter name of book:'
    book_name = gets.chomp
    puts 'Enter book Author:'
    book_author = gets.chomp
    added_book = Book.new(book_name, book_author)
    @books.push(added_book)
    puts 'Book successfully created'
    puts 'Choose another option to perform another operation'
    options_list
    choose_option
  end

  # method to display a list of people added
  def list_people
    if @person.empty?
      puts 'No person added yet.'
      puts 'Choose option 3 to add a person'
    else
      @person.each do |person|
        puts "[ @Id:[#{person.id}] Name: #{person.name} Age: #{person.age} Class:#{person.class}]"
      end
    end
    choose_option
  end

  # method to create a student
  def create_student
    puts 'Enter name of student'
    name = gets.chomp.downcase
    puts 'Enter age of student'
    age = gets.chomp.to_i
    print 'Has parent permission [Y/N]:'
    permission = gets.chomp.downcase

    case permission
    when 'y'
      @person.push(Student.new(true, age, name))
      puts 'student created successfully'
    when 'n'
      @person.push(Student.new(false, age, name))
      puts 'student created successfully'
    else
      puts 'Invalid  permission choose [Y/N]'
    end
    options_list
    choose_option
  end

  # method to create a teacher
  def create_teacher
    puts 'Enter name'
    name = gets.chomp
    puts 'Enter age'
    age = gets.chomp.to_i
    puts 'Enter specialization'
    specialization = gets.chomp
    @person.push(Teacher.new(specialization, age, name))
    puts 'Teacher successfully created'
    puts ''
    options_list
    choose_option
  end

  # method to add a new person
  def create_person
    puts ''
    print 'Do you want to create a new person a student?(1) or a teacher?(2)? [Enter number]:'
    choice = gets.chomp.to_i
    case choice
    when 1
      puts 'run create student method'
      create_student
    when 2 then puts 'run create teacher method'
                create_teacher
    else
      puts 'Please enter a valid choice either 1 or 2'
    end
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
    when 1 then list_books
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rental_for_a_person
    when 7 then stop_application
    else
      handle_invalid_option
    end
  end

  def handle_invalid_option
    puts 'Invalid option. Please choose between 1 and 7'
  end
end
