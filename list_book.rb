require './app'
require './book'

class ListBook
  attr_accessor :books

  def initialize(books, app_instance)
    @books = books
    @app_instance = app_instance
  end

  # method to return list of books
  def list_books
    if @books.empty?
      puts 'No books available.'
      puts 'Choose 4 to add a book'
    else
      puts 'List of all books:'
      @books.each { |book| puts "Book-title: #{book['title']} Author: #{book['author']}" }
    end
    @app_instance.choose_option
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
