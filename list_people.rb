require './app'
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
        puts "[ @Id:[#{person.id}] Name: #{person.name} Age: #{person.age} Class:#{person.class}]"
      end
    end
    @app_instance.choose_option
  end
end
