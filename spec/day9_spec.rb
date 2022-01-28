require 'rspec'
require_relative '../lib/day9'

describe 'day 9' do
  input = Day9.load_data('data/day9example.txt')
  context 'part 1' do
    it 'loads points into 2D array' do
      expect(input.size).to eq(5)
      expect(input[0].size).to eq(10)
    end
  end
end
