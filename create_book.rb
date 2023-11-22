require './app'
require './book'
require 'json'

class CreateBook
  def initialize(books, app_instance)
    @books = books
    @app_instance = app_instance
  end

  # method to create a new book by the user
  def create_book
    puts 'Enter name of book:'
    book_name = gets.chomp
    puts 'Enter book Author:'
    book_author = gets.chomp

    # Load existing books from the JSON file
    existing_books = load_books_from_json

    added_book = Book.new(book_name, book_author)
    @books.push(added_book)
    existing_books.push({ title: added_book.title, author: added_book.author })

    save_books_to_json(existing_books)

    puts 'Book successfully created'
    puts 'Choose another option to perform another operation'
    @app_instance.options_list
    @app_instance.choose_option
  end

  # method to save books to 'books.json'
  def save_books_to_json(books)
    File.open('books.json', 'w') do |file|
      file.puts JSON.pretty_generate(books)
    end
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
end
