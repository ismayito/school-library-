require './app'

class ListPeople
  attr_accessor :person, :app_instance

  def initialize(person, app_instance)
    @person = person
    @app_instance = app_instance
  end

  # method to display a list of all people (loaded from JSON and newly created)
  def list_all_people
    all_people = @app_instance.instance_variable_get(:@stored_people) + @person
    if all_people.empty?
      puts 'No person added yet.'
      puts 'Choose option 3 to add a person'
    else
      all_people.each do |person|
        if person.is_a?(Hash)
          # Handle the Hash case (loaded from JSON)
          puts "[ @Id:[#{person['id']}] Name: #{person['name']} Age: #{person['age']} Class:#{person['class']}]"
        elsif person.is_a?(Person)
          # Handle the Person class instance case
          puts "[ @Id:[#{person.id}] Name: #{person.name} Age: #{person.age} Class:#{person.class}]"
        else
          # Handle any other case (if needed)
          puts "Unknown type: #{person.inspect}"
        end
      end
    end
    @app_instance.choose_option
  end
end
