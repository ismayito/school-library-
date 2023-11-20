require './app'
class ListPeople
  attr_accessor :person

  def initialize(person)
    @person = person
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
    App.new.choose_option
  end
end
