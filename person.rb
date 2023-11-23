require './decorator'
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def add_rentals(book, date)
    Rental.new(date, self, book)
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
