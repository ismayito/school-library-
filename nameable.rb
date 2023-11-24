class Nameable
  # Method to be implemented by subclasses to return the correct name
  def right_holder
    raise NotImplementedError, "#{self.class} must implement the '#{__method__}' method"
  end
end
