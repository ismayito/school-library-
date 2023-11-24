require 'json'
require_relative '../person'
require_relative '../rental'

RSpec.describe Person do
  let(:title) { 'William Shakespear' }
  let(:age_num) { 45 }
  let(:parent_permission) { true }
  let(:person) { Person.new(age_num, title, parent_permission: true) }

  describe '#initialize' do
    it 'person instance with title, age_num, parent_permission and rentals' do
      expect(person.id).to be_an(Integer)
      expect(person.name).to eq(title)
      expect(person.age).to eq(age_num)
      expect(person.instance_variable_get(:@parent_permission)).to eq(parent_permission)
      expect(person.rentals).to be_an(Array)
    end
  end

  describe '#can_use_services?' do
    context 'subject is 18 years or more' do
      let(:age_num) { 76 }

      it 'program correctly returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'subject is below 18 but parent permission is true' do
      let(:age_num) { 12 }

      it 'program correctly returns true' do
        expect(person.can_use_services?).to be true
      end
    end
  end

  describe '#right_holder' do
    it 'return person name' do
      expect(person.right_holder).to eq(title)
    end
  end
end
