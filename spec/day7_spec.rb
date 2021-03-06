require 'rspec'
require_relative '../lib/day7'

describe 'Day 7' do
  crabs = Day7.load_data('data/day7example.txt')

  context 'Part 1' do
    it 'crab positions are read into array' do
      expect(crabs).to eq([16,1,2,0,4,2,7,1,2,14])
    end

    it 'calculates fuel used to move to a specific position' do
      expect(Day7.fuel_for_pos(crabs, 2)).to eq(37)
      expect(Day7.fuel_for_pos(crabs, 1)).to eq(41)
      expect(Day7.fuel_for_pos(crabs, 3)).to eq(39)
      expect(Day7.fuel_for_pos(crabs, 10)).to eq(71)
    end

    it 'position that uses minimum fuel uses 37' do
      expect(Day7.fuel_for_best_pos(crabs)).to eq(37)
    end
  end

  context 'Part 2' do
    it 'min fuel pos with exp fuel use' do
      expect(Day7.exp_fuel_for_pos(crabs, 5)).to eq(168)
      expect(Day7.exp_fuel_for_pos(crabs, 2)).to eq(206)
    end

    it 'pos using min exp fuel uses 168' do
      expect(Day7.exp_fuel_for_best_pos(crabs)).to eq(168)
    end
  end
end
