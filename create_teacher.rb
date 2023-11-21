require './app'
class CreateTeacher
  attr_accessor :person

  def initialize(person, app_instance)
    @person = person
    @app_instance = app_instance
  end

  def create_teacher
    puts 'Enter name'
    name = gets.chomp
    puts 'Enter age'
    age = gets.chomp.to_i
    puts 'Enter specialization'
    specialization = gets.chomp
    @person.push(Teacher.new(specialization, age, name))
    puts 'Teacher successfully created'
    puts ''
    @app_instance.options_list
    @app_instance.choose_option
  end
end
