require './launch'

class Main
  def menu_choices
    [
      'List all books',
      'List all people',
      'Create a person (teacher or student).',
      'Create a book',
      'Create a rental',
      'List all rentals for a given person id',
      'Exit the application'
    ]
  end

  def print_options
    puts "Choose an option to get started: \n\n"
    menu_choices.each_with_index { |option, mark| puts "#{mark + 1} - #{option}" }
    puts "\nYour choice: "
  end
end

launch = Launch.new
launch.start_app
