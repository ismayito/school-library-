# Base interface for creating a decorator
class Nameable
  def correct_name
    raise NotImplementedError
  end
end

# Base Decorator that extends and inherits from Nameable interface
class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# Decorator class for returning a capitalized name sting
class CapitalizeDecorator < Decorator
  def correct_name
    puts @nameable.correct_name.capitalize
    @nameable.correct_name.capitalize
  end
end

# Decorator class that returns a name string if it's length is not greater than 10 characters
# otherwise returns the trimmed name
class TrimmerDecorator < Decorator
  def correct_name
    trim_word = @nameable.correct_name.length > 10 ? @nameable.correct_name[0, 10] : @nameable.correct_name
    puts trim_word
    trim_word
  end
end

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_service?
    of_age? || @parent_permission
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
