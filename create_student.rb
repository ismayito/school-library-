require './app'
require 'json'
class CreateStudent
  attr_accessor :person

  def initialize(person, app_instance)
    @person = person
    @app_instance = app_instance
  end

  # method to save student to 'books.json'
  def save_persons_to_json(persons)
    File.write('person.json', JSON.pretty_generate(persons.map(&:to_hash)))
  end

  # method to create a student
  def create_student
    puts 'Enter name of student'
    name = gets.chomp.downcase
    puts 'Enter age of student'
    age = gets.chomp.to_i
    print 'Has parent permission [Y/N]:'
    permission = gets.chomp.downcase

    case permission
    when 'y'
      @person.push(Student.new(true, age, name))
      save_persons_to_json(@person)
      puts 'student created successfully'
    when 'n'
      @person.push(Student.new(false, age, name))
      save_persons_to_json(@person)
      puts 'student created successfully'
    else
      puts 'Invalid  permission choose [Y/N]'
    end
    @app_instance.options_list
    @app_instance.choose_option
  end
end

# method to load person from 'person.json'
def load_persons_from_json
  if File.exist?('person.json')
    json_data = File.read('person.json')
    begin
      JSON.parse(json_data)
    rescue StandardError
      []
    end
  else
    []
  end
end
