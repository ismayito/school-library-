require './app'
class CreateStudent
  attr_accessor :person

  def initialize(person)
    @person = person
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
      puts 'student created successfully'
    when 'n'
      @person.push(Student.new(false, age, name))
      puts 'student created successfully'
    else
      puts 'Invalid  permission choose [Y/N]'
    end
    App.new.options_list
    App.new.choose_option
  end
end
