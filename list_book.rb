require './app'
require './book'

class ListBook
  attr_accessor :books

  def initialize(books)
    @books = books
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
    App.new.choose_option
  end
end
