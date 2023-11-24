require './app'

class Launch
  def call_options
    {
      '1' => -> { @app.show_available_books },
      '2' => -> { @app.show_available_people },
      '3' => lambda {
               @app.add_person_to_list
               puts "person created successfully\n"
             },
      '4' => lambda {
               @app.add_book_to_list
               puts 'Book successfully created'
             },
      '5' => lambda {
               @app.add_rental_to_list
               puts 'Rental created successfully'
             },
      '6' => -> { @app.display_person_rentals },
      '7' => -> { @app.load_to_json }
    }
  end

  def start_app
    @app = App.new
    puts "\nWelcome to School Library Console App UI"
    print "Running the App... \n\n"
    main = Main.new
    loop do
      main.print_options
      calls = call_options
      choice = gets.chomp
      if calls[choice]
        calls[choice].call
        return if choice == '7'
      else
        puts 'Error: Invalid option'
      end

      puts ' '
    end
  end
end
