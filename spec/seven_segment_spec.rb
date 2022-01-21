require 'rspec'
require_relative '../lib/seven_segment'

describe 'SevenSegment' do
  # 1, 4, 7, 8 use unique number of segments
  # 1 = 2
  # 4 = 4
  # 7 = 3
  # 8 = 7

  test_line = 'acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf'
  test_obj = SevenSegment.new(test_line)
  exp_zero = 'cagedb'.chars.to_set
  exp_one = 'ba'.chars.to_set
  exp_two = 'gcdfa'.chars.to_set
  exp_three = 'fbcad'.chars.to_set
  exp_four = 'eafb'.chars.to_set
  exp_five = 'cdfbe'.chars.to_set
  exp_six = 'cdfgeb'.chars.to_set
  exp_seven = 'dab'.chars.to_set
  exp_eight = 'acedgfb'.chars.to_set
  exp_nine = 'cefabd'.chars.to_set

  exp_top = 'd'.chars.to_set
  exp_upper_left = 'e'.chars.to_set
  exp_upper_right = 'a'.chars.to_set
  exp_middle = 'f'.chars.to_set
  exp_lower_left = 'g'.chars.to_set
  exp_lower_right = 'b'.chars.to_set
  exp_bottom = 'c'.chars.to_set

  it 'zero' do
    expect(test_obj.zero).to eq(exp_zero)
  end

  it 'one' do
    expect(test_obj.one.class).to eq(Set)
    expect(test_obj.one.size).to eq(exp_one.size)
    expect(test_obj.one).to eq(exp_one)
  end

  it 'two' do
    expect(test_obj.two).to eq(exp_two)
  end

  it 'three' do
    expect(test_obj.three).to eq(exp_three)
  end

  it 'four' do
    expect(test_obj.four).to eq(exp_four)
  end

  it 'five' do
    expect(test_obj.five).to eq(exp_five)
  end

  it 'six' do
    expect(test_obj.six).to eq(exp_six)
  end

  it 'seven' do
    expect(test_obj.seven).to eq(exp_seven)
  end

  it 'eight' do
    expect(test_obj.eight).to eq(exp_eight)
  end

  it 'nine' do
    expect(test_obj.nine).to eq(exp_nine)
  end

  it 'top' do
    expect(test_obj.top).to eq(exp_top)
  end

  it 'bottom' do
    expect(test_obj.bottom).to eq(exp_bottom)
  end

  it 'lower left' do
    expect(test_obj.lower_left).to eq(exp_lower_left)
  end

  it 'middle' do
    expect(test_obj.middle).to eq(exp_middle)
  end

  it 'upper left' do
    expect(test_obj.upper_left).to eq(exp_upper_left)
  end

  it 'lower right' do
    expect(test_obj.lower_right).to eq(exp_lower_right)
  end

  it 'upper right' do
    expect(test_obj.upper_right).to eq(exp_upper_right)
  end

  it 'decode output' do
    expect(test_obj.decode_output).to eq(5353)
  end
end
