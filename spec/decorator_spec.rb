require 'rspec'
require_relative '../decorator'

# Mock class implementing the Nameable interface for testing
class MockNameable < Nameable
  attr_accessor :name

  def initialize(name)
    super()
    @name = name
  end

  def correct_name
    @name
  end
end

RSpec.describe Nameable do
  it 'raises NotImplementedError for correct_name method' do
    nameable = Nameable.new
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end

RSpec.describe Decorator do
  it 'passes correct_name method to the wrapped object' do
    nameable = MockNameable.new('test')
    decorator = Decorator.new(nameable)
    expect(decorator.correct_name).to eq('test')
  end
end

RSpec.describe CapitalizeDecorator do
  it 'capitalizes the correct_name result' do
    nameable = MockNameable.new('test')
    decorator = CapitalizeDecorator.new(nameable)
    expect(decorator.correct_name).to eq('Test')
  end
end

RSpec.describe TrimmerDecorator do
  it 'trims the correct_name result if length is greater than 10 characters' do
    nameable = MockNameable.new('verylongname')
    decorator = TrimmerDecorator.new(nameable)
    expect(decorator.correct_name).to eq('verylongna')
  end

  it 'does not trim the correct_name result if length is 10 characters or less' do
    nameable = MockNameable.new('shortname')
    decorator = TrimmerDecorator.new(nameable)
    expect(decorator.correct_name).to eq('shortname')
  end
end
