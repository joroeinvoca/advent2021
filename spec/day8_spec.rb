require 'rspec'
require_relative '../lib/day8'

describe 'Day 8' do
  context 'Part 1' do
    input = Day8.load_input('data/day8example.txt')

    it 'loads data' do
      first_line_key = ['be', 'cfbegad', 'cbdgef', 'fgaecd', 'cgeb', 'fdcge', 'agebfd', 'fecdb', 'fabcd', 'edb']
      expect(input.include?(first_line_key))
      expect(input[first_line_key] == ['fdgacbe', 'cefdb', 'cefbgd', 'gcbe'])
    end

    it '26 unique-shaped values in the display portion' do
      expect(Day8.count_unique_numbers(input)).to eq(26)
    end
  end

  context 'Part 2' do
    it 'sum of example outputs is 61229' do
      expect(Day8.calc_and_sum_output_values('data/day8example.txt')).to eq(61229)
    end
  end
end
