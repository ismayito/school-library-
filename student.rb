require './person'

class Student < Person
  def initialize(classrom)
    super(name = 'unknown', age, parent_permission = true)
    @classrom = classrom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
