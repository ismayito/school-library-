require './nameable'

# Define the Person class, which is a subclass of Nameable
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Not specified', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  # Method to return the correct name of the person
  def right_holder
    @name
  end

  def new_rental(rental)
    @rentals << rental
    rental.person = self
  end

  private

  # Private method to check if the person is of age (18 years or older)
  def of_age?
    @age >= 18
  end
end
