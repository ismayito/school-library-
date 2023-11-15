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
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end

# Decorator class for returning a capitalized name sting
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# Decorator class that returns a name string if it's length is not greater than 10 characters
# otherwise returns the trimmed name
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0, 10] : @nameable.correct_name
  end
end
