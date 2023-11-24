require './person'

class Student < Person
  # Attribute accessor for parent_permission and attribute reader for classroom
  attr_accessor :parent_permission
  attr_reader :classroom

  # Constructor method for initializing a new Student object
  def initialize(age, classroom, name = 'Not specified')
    # Call the constructor of the superclass (Person) with age, name, and default parent_permission
    super(age, name, parent_permission: true)
    # Set the classroom attribute specific to the Student class
    @classroom = classroom
  end

  # Setter method for changing the classroom, which also adds the student to the new classroom
  def classroom=(new_classroom)
    @classroom = new_classroom
    # Add the student to the new classroom
    new_classroom.new_student(self)
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
      classroom: @classroom
    }.to_json(*args)
  end
end
