require './book'
require './student'
require './teacher'
require './rental'
require './person'
require 'json'

def create_rental
  list_person
  print 'ID of person: (Choose "ID" from the above list)'
  person_id = gets.chomp.to_i
  person = @person.find { |p| p['id'] == person_id }
  person_hashed = Person.new(person['age'], person['name'], id: person['id'])
  list_book
  print 'book type: (Choose book from the above list)'
  book_title = gets.chomp
  book = @books.find { |b| b['title'] == book_title }
  book_hashed = Book.new(book['title'], book['author'])
  print 'Enter rental date: '
  rental_date = gets.chomp
  rental = Rental.new(rental_date, person_hashed, book_hashed)
  @rentals << rental
  # method to rentals student to 'books.json'
  save_rentals_to_json(@rentals)
  puts 'Rental created successfully.'
end

def list_person
  if @person.empty?
    puts 'No people added yet. Enter 3 to create a person.'
    choose_option
  else
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

def list_book
  if @books.empty?
    puts 'No books added yet. Enter 4 to create a new book.'
    choose_option
  else
    puts 'List of all available books:'
    @books.each { |book| puts "Book-title: #{book['title']} Author: #{book['author']}" }
  end
end

def person_to_hash(person)
  {
    'id' => person.id,
    'name' => person.name,
    'age' => person.age,
    'rentals' => [], # Assuming you don't want to include rentals in the person hash
    'classroom' => person.class # Add other attributes as needed
  }
end

def save_rentals_to_json(rentals)
  existing_rentals = load_rentals_from_json
  update_existing_rentals(existing_rentals, rentals)
  write_rentals_to_json(existing_rentals)
end

def update_existing_rentals(existing_rentals, rentals)
  rentals.each do |rental|
    person_id = rental.person.id
    existing_person = existing_rentals.find { |r| r['person']['id'] == person_id }
    if existing_person
      existing_person['person']['rentals'] << {
        'date' => rental.date,
        'book' => book_to_hash(rental.book)
      }
    else
      add_new_person(existing_rentals, rental)
    end
  end
end

def add_new_person(existing_rentals, rental)
  existing_rentals << {
    'person' => person_to_hash(rental.person)
  }
  existing_rentals.last['person']['rentals'] = [{
    'date' => rental.date,
    'book' => book_to_hash(rental.book)
  }]
end

def write_rentals_to_json(existing_rentals)
  File.write('rentals.json', JSON.pretty_generate(existing_rentals))
end

# Convert a Book object to a hash
def book_to_hash(book)
  {
    'title' => book.title,
    'author' => book.author
  }
end

def load_rentals_from_json
  if File.exist?('rentals.json')
    json_data = File.read('rentals.json')
    begin
      JSON.parse(json_data)
    rescue StandardError
      []
    end
  else
    []
  end
end
