require './student'
require './teacher'
require './create_student'
require './create_teacher'

class CreatePerson
  attr_accessor :person

  def initialize(person, app_instance)
    @person = person
    @app_instance = app_instance
  end

  # method to add a new person
  def create_person
    puts ''
    print 'Do you want to create a new person a student?(1) or a teacher?(2)? [Enter number]:'
    choice = gets.chomp.to_i
    case choice
    when 1
      puts 'run create student method'
      CreateStudent.new(@person, @app_instance).create_student
    when 2 then puts 'run create teacher method'
                CreateTeacher.new(@person, @app_instance).create_teacher
    else
      puts 'Please enter a valid choice either 1 or 2'
    end
  end
end
