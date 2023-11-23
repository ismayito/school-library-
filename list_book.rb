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
    loaded_books = load_books_from_json + @books

    if loaded_books.empty?
      puts 'No books available.'
      puts 'Choose 4 to add a book'
    else
      puts 'List of all books:'
      loaded_books.each do |book|
        puts "Title: #{book['title']}"
        puts "Author: #{book['author']}"
      end
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
