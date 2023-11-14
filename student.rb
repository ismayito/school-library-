require './person'

class Student < Person
  def initialize(classroom)
    super('unknown', nil, parent_permission: true)
    @classrom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
