require 'rspec'
require_relative '../lib/day9'

describe 'day 9' do
  input = Day9.load_data('data/day9example.txt')
  context 'part 1' do
    it 'loads points into 2D array' do
      expect(input.size).to eq(5)
      expect(input[0].size).to eq(10)
      expect(input[0][0].class).to eq(Integer)
    end

    it 'low points in top row' do
      expect(Day9.find_top_low_points(input, 5, 10)).to match_array([1, 0])
    end

    it 'low points in bottom row' do
      expect(Day9.find_bottom_low_points(input, 5, 10)).to match_array([5])
    end

    it 'low points on sides' do
      expect(Day9.find_side_low_points(input, 5, 10)).to match_array([])
    end

    it 'low points middles' do
      expect(Day9.find_middle_low_points(input, 5, 10)).to match_array([5])
    end

    it 'sum of risk levels of all low points' do
      expect(Day9.sum_risk_level(input)).to eq(15)
    end
  end
end
