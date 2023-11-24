def borrowed_items(book, rental)
  rental.book = if book.instance_of?(Book)
                  book
                else
                  # Create a new Book object if the input is a Hash
                  Book.new(book['title'], book['author'])
                end
end

# Method to set the person for a rental, handling different input types
def book_borrower(person, rental)
  rental.person = if person.instance_of?(Teacher) || person.instance_of?(Student)
                    person
                  elsif person['class'] == 'Student'
                    # Create a new Student object if the input is a Hash with 'class' as 'Student'
                    Student.new(person['age'], nil, person['name'])
                  else
                    # Create a new Teacher object for other cases
                    Teacher.new(person['age'], person['specialization'], person['name'])
                  end
end

# Method to filter rentals based on the person's ID
def book_borrowed_by_person(rentals, id)
  picked_borrow = []
  rentals.each do |rental|
    # Check if the rental is a Hash and has the specified person ID
    picked_borrow << rental if rental.instance_of?(Hash) && rental['person_id'] == id
    # Check if the rental is an instance of Rental and has the specified person ID
    picked_borrow << rental if rental.instance_of?(Rental) && rental.person.id == id
  end
  picked_borrow
end
