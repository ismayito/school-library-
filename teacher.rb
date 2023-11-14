require './person'

class Teacher < Person
  def initialize(specialization)
    super(name = 'unknown', age, parent_permission = true)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
