require 'json'

# Method to load people data from 'person.json'
def load_people_data
  # Check if 'person.json' exists and is not empty
  if File.exist?('person.json') && !File.empty?('person.json')
    # Parse and return the content of 'person.json'
    JSON.parse(File.read('person.json'))
  else
    # Return an empty array if 'person.json' doesn't exist or is empty
    []
  end
end

# Method to load books data from 'books.json'
def load_books_data
  # Check if 'books.json' exists and is not empty
  if File.exist?('books.json') && !File.empty?('books.json')
    # Parse and return the content of 'books.json'
    JSON.parse(File.read('books.json'))
  else
    # Return an empty array if 'books.json' doesn't exist or is empty
    []
  end
end

# Method to load rentals data from 'rentals.json'
def load_rentals_data
  # Check if 'rentals.json' exists and is not empty
  if File.exist?('rentals.json') && !File.empty?('rentals.json')
    # Parse and return the content of 'rentals.json'
    JSON.parse(File.read('rentals.json'))
  else
    # Return an empty array if 'rentals.json' doesn't exist or is empty
    []
  end
end
