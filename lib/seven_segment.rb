require 'Set'

class SevenSegment

  attr_reader :zero, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine
  attr_reader :top, :upper_left, :upper_right, :middle, :lower_left, :lower_right, :bottom

  def initialize(data)
    split_line = data.split(' | ')
    @patterns = split_line[0].split(' ').map{ |str| str.chars.to_set}
    @output = split_line[1].split(' ').map{ |str| str.chars.to_set}

    @one = get_unique_number(2)
    @four = get_unique_number(4)
    @seven = get_unique_number(3)
    @eight = get_unique_number(7)

    @top = @seven - @one
    @bottom = calc_bottom
    @lower_left = @eight - @seven - @four - @bottom
    @middle = calc_middle
    @upper_left = calc_upper_left
    @lower_right = calc_lower_right
    @upper_right = @one - @lower_right

    @zero = @eight - @middle
    @two = @eight - @upper_left - @lower_right
    @six = @eight - @upper_right
    @nine = @eight - @lower_left
    @three = @nine - @upper_left
    @five = @six - @lower_left
  end

  def get_unique_number(length)
    @patterns.find { |pat_set| pat_set.size == length}
  end

  def common_legs_of_size(length)
    results = @patterns.select{ |pat| pat.size == length }
    for i in 1 .. results.size - 1
      results[0] = results[0] & results[i]
    end
    results[0]
  end

  def calc_bottom
    common_legs_of_size(5) & common_legs_of_size(6) - @top
  end

  def calc_middle
    common_legs_of_size(5) - @top - @bottom - @lower_left
  end

  def calc_upper_left
    common_legs_of_size(6) - @seven - @bottom
  end

  def calc_lower_right
    common_legs_of_size(6) - @bottom - @upper_left - @top
  end

  def decode_output
    decoded_value = ''
    @output.each do |digit|
      if digit == @zero
        decoded_value << '0'
      elsif digit == @one
        decoded_value << '1'
      elsif digit == @two
        decoded_value << '2'
      elsif digit == @three
        decoded_value << '3'
      elsif digit == @four
        decoded_value << '4'
      elsif digit == @five
        decoded_value << '5'
      elsif digit == @six
        decoded_value << '6'
      elsif digit == @seven
        decoded_value << '7'
      elsif digit == @eight
        decoded_value << '8'
      elsif digit == @nine
        decoded_value << '9'
      end
    end
    decoded_value.to_i
  end
end
