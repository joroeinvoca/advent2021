require 'rspec'
require_relative '../lib/day7'

describe 'Day 7' do
  context 'Part 1' do
    it 'crab positions are read into array' do
      expect(Day7.load_data('data/day7example.txt')).to eq([16,1,2,0,4,2,7,1,2,14])
    end
  end
end
