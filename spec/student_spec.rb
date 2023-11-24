require_relative '../student'
require 'json'

describe Student do
  describe '#initialize' do
    it ' should create a new Student object with default parent permission' do
      student = Student.new(15, 'Math Class', 'Alice')

      expect(student).to be_an_instance_of(Student)
      expect(student.age).to eq(15)
      expect(student.name).to eq('Alice')
      expect(student.parent_permission).to be true
      expect(student.rentals).to be_empty
      expect(student.classroom).to eq('Math Class')
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the Student object' do
      student = Student.new(17, 'English Class', 'Charlie')
      json_representation = student.to_json

      expect(json_representation).to be_a(String)

      parsed_json = JSON.parse(json_representation)
      expect(parsed_json['class']).to eq('Student')
      expect(parsed_json['id']).to eq(student.id)
      expect(parsed_json['name']).to eq('Charlie')
      expect(parsed_json['age']).to eq(17)
      expect(parsed_json['parent_permission']).to be true
      expect(parsed_json['rentals']).to eq([])
      expect(parsed_json['classroom']).to eq('English Class')
    end
  end
end
