require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  let(:classroom) { described_class.new }
  let(:student) { Student.new(25, nil, 'John Wick') }

  describe '#initialize' do
    it 'initializes classroom object' do
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'evokes default label, if none is specified' do
      expect(classroom.label).to eq('Label not specified')
    end

    it 'creates an empty array for student' do
      expect(classroom.students).to be_an_instance_of(Array)
      expect(classroom.students).to be_empty
    end
  end

  describe '#label' do
    it 'returns the label' do
      classroom.label = 'Science'
      expect(classroom.label).to eq('Science')
    end
  end

  describe '#students' do
    it 'returns the students array' do
      expect(classroom.students).to be_an_instance_of(Array)
    end
  end
end
