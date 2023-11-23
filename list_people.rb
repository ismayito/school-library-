require './app'
require './student'
require './teacher'
class ListPeople
  attr_accessor :person

  def initialize(person, app_instance)
    @person = person
    @app_instance = app_instance
  end

  # method to display a list of people added
  def list_people
    if @person.empty?
      puts 'No person added yet.'
      puts 'Choose option 3 to add a person'
    else
      @person.each do |person|
        # puts "[ @Id:[#{person.id}]  Name: #{person.name} Age: #{person.age} Class:#{person.class}]"
        if person.is_a?(Student)
          puts "[ @Id:[#{person.id}] Name: #{person.name} Age: #{person.age} Class:#{person.class}]"
        elsif person.is_a?(Teacher)
          # Handle the Teacher class
          puts "[ @Id:[#{person.id}] Name: #{person.name} Age: #{person.age} Specialization: #{person.specialization}]"
        else
          # Handle the hash case differently
          puts "[ @Id:[#{person['id']}] Name: #{person['name']} Age: #{person['age']} Class:#{person['class']}]"
        end
      end
    end
    @app_instance.choose_option
  end
end
