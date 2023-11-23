require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end

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
