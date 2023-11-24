class Classroom
  # Attribute accessor for label and attribute reader for students
  attr_accessor :label
  attr_reader :students

  # Constructor method for initializing a new Classroom object with an optional label parameter
  def initialize(label = 'Label not specified')
    @label = label
    @students = []
  end

  # Method to add a student to the classroom and set the classroom for the student
  def new_student(student)
    @students << student
    student.classroom = self
  end
end
