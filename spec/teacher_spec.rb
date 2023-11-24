require_relative '../teacher'
require 'json'

describe Teacher do
  describe '#initialize' do
    teacher = Teacher.new(23, 'math', 'mayito')
    it 'should create  a new teacher object' do
      expect(teacher.age).to eq(23)
      expect(teacher.name).to eq('mayito')
      expect(teacher.specialization).to eq('math')
    end
  end

  describe '#can_use_services' do
    it 'should return true if a teacher can use services' do
      teacher = Teacher.new(23, 'math', 'mayito')
      result = teacher.can_use_services?
      expect(result).to be true
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the Teacher object' do
      teacher = Teacher.new(30, 'Chemistry', 'Bob Smith')
      json_representation = teacher.to_json

      expect(json_representation).to be_a(String)

      parsed_json = JSON.parse(json_representation)
      expect(parsed_json['class']).to eq('Teacher')
      expect(parsed_json['id']).to eq(teacher.id)
      expect(parsed_json['name']).to eq('Bob Smith')
      expect(parsed_json['age']).to eq(30)
      expect(parsed_json['parent_permission']).to be true
      expect(parsed_json['rentals']).to eq([])
      expect(parsed_json['specialization']).to eq('Chemistry')
    end
  end
end
