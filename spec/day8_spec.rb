require 'rspec'
require_relative '../lib/day8'

describe 'Day 8' do
  context 'Part 1' do
    # 1, 4, 7, 8 use unique number of segments
    # 1 = 2
    # 4 = 4
    # 7 = 3
    # 8 = 7

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
end
