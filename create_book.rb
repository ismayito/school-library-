require './app'
require './book'
class CreateBook
  attr_accessor :books

  def initialize(books)
    @books = books
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
    App.new.options_list
    App.new.choose_option
  end
end
