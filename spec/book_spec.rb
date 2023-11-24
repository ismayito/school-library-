require 'json'
require_relative '../book'

RSpec.describe Book do
  let(:header) { 'The Amazing Adventures of Alice' }
  let(:writer) { 'Lewis Carroll' }
  let(:book) { Book.new(header, writer) }

  describe '#initialize' do
    it 'created book should be a product of provided header and writer' do
      expect(book.title).to eq(header)
      expect(book.author).to eq(writer)
      expect(book.rentals).to be_an(Array)
    end
  end

  describe '#new_rental' do
    it 'creare a rental and relate it with the the added book' do
      rental = instance_double('Rental')
      expect(rental).to receive(:book=).with(book)
      book.new_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end

  describe '#to_json' do
    it 'return data in json format' do
      json_data = book.to_json
      parsed_json = JSON.parse(json_data)
      expect(parsed_json['title']).to eq(header)
      expect(parsed_json['author']).to eq(writer)
      expect(parsed_json['rentals']).to eq(book.instance_variable_get(:@rentals))
    end
  end
end
