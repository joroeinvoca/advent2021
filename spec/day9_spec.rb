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

  context 'part 2' do
    complete = [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]
    incomplete = [[1,1,1,1,1],[1,1,0,1,1],[0,1,1,1,0]]

    it 'search_complete is false when not complete' do
      expect(Day9.search_complete(incomplete)).to eq(false)
    end

    it 'search_complete is true when complete' do
      expect(Day9.search_complete(complete))
    end

    it 'all basins' do
      expect(Day9.find_all_basins(input)).to match_array([3, 9, 14, 9])
    end

    it '3 basins multiplied' do
      expect(Day9.multiply_basins(input)).to eq(1134)
    end
  end
end
