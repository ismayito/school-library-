def print_rentals(books)
  books.each_with_index do |book, mark|
    # Check if the item is a Hash (possibly representing a book) and print information accordingly
    puts "#{mark}) Title: \"#{book['title']}\", Author: #{book['author']}" if book.instance_of?(Hash)
    # Check if the item is an instance of the Book class and print information accordingly
    puts "#{mark}) Title: \"#{book.title}\", Author: #{book.author}" if book.instance_of?(Book)
  end
end

# Method to show information about rental picks (persons)
def show_rental_picks(persons)
  persons.each_with_index do |person, mark|
    # Check if the item is an instance of Student or Teacher class and print information accordingly
    if person.instance_of?(Student) || person.instance_of?(Teacher)
      puts "#{mark}) [#{person.class}]\
      Name: #{person.name},\
      ID: #{person.id},\
      Age: #{person.age}"
    else
      # Check if the item is a Hash (possibly representing a person) and print information accordingly
      puts "#{mark}) [#{person['class']}]\
      Name: #{person['name']},\
      ID: #{person['id']},\
      Age: #{person['age']}"
    end
  end
end

# Method to print information about picked borrows
def print_picked_borrows(picked_borrow)
  puts 'Rentals: '
  picked_borrow.select do |rental|
    # Check if the item is an instance of Rental class and print information accordingly
    puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.instance_of?(Rental)
    # Check if the item is a Hash (possibly representing a rental) and print information accordingly
    if rental.instance_of?(Hash)
      puts "Date: #{rental['date']}, Book \"#{rental['book_title']}\" by #{rental['book_author']}"
    end
  end
end
