require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  # Converts the Teacher object to a hash representation.
  # Returns: a hash containing relevant information about the teacher
  def to_hash
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals,
      classroom: @classroom
    }
  end

  # Determines whether the teacher can use a particular service.
  # Returns: true (Teachers can use the service)
  def can_use_service?
    true
  end
end
