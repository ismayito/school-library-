require './person'

class Teacher < Person
  # Attribute reader for the specialization of the teacher
  attr_reader :specialization

  # Constructor method for initializing a new Teacher object
  def initialize(age, specialization, name)
    # Call the constructor of the superclass (Person) with age and name parameters
    super(age, name)
    # Set the specialization attribute specific to the Teacher class
    @specialization = specialization
  end

  # Method to check if the teacher can use services (placeholder implementation returning true)
  def can_use_services?
    true
  end

  # Method to convert the object to a JSON representation
  def to_json(*args)
    {
      class: self.class,
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals,
      specialization: @specialization
    }.to_json(*args)
  end
end
