require './app'
class CreateTeacher
  attr_accessor :person

  def initialize(person)
    @person = person
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
    App.new.options_list
    App.new.choose_option
  end
end
