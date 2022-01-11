require 'rspec'
require_relative '../lib/day6'

describe 'Day6' do
  fish_arr = Day6.load_data('data/day6example.txt')
  fish18 = Day6.add_days(fish_arr, 18)
  fish80 = Day6.add_days(fish_arr, 80)
  #fish256 = Day6.add_days(fish_arr, 256)

  it 'data load results in 5 initial fish' do
    expect(fish_arr.size).to eq(5)
  end

  it 'day 1 countdowns = [2,3,2,0,1]' do
    expect(Day6.add_days(fish_arr, 1)).to eq([2,3,2,0,1])
  end

  it 'example at 18 days' do
    expect(fish18).to eq([6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8])
  end

  it 'at 18 days, 26 fish' do
    expect(fish18.size).to eq(26)
  end

  it 'at 80 days, 5934 fish' do
    expect(fish80.size).to eq(5934)
  end

  xit 'at 256 days, 26984457539 fish' do
    expect(fish256.size).to eq(26984457539)
  end

  context 'testing alternate strategies' do
    it 'test new solution' do
      expect(Day6.count_all_fish(fish_arr,18)).to eq(fish18.size)
    end

    it '256 days = 26984457539' do
      expect(Day6.count_all_fish(fish_arr, 256)).to eq(26984457539)
    end
  end
end
