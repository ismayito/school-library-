require './app'
require 'json'
class CreateTeacher
  attr_accessor :person

  def initialize(person, app_instance)
    @person = person
    @app_instance = app_instance
  end

  # method to save the tearcher into person.json file
  def save_persons_to_json(persons)
    File.write('person.json', JSON.pretty_generate(persons.map(&:to_hash)))
  end

  def create_teacher
    puts 'Enter name'
    name = gets.chomp
    puts 'Enter age'
    age = gets.chomp.to_i
    puts 'Enter specialization'
    specialization = gets.chomp
    @person.push(Teacher.new(specialization, age, name))
    save_persons_to_json(@person)
    puts 'Teacher successfully created'
    puts ''
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
