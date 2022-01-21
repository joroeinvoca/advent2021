require_relative 'seven_segment'

class Day8
  def self.load_input(file)
    raw = File.readlines(file)
    input = {}
    raw.each do |line|
      split_line = line.split(' | ')
      input[split_line[0].split(' ')] = split_line[1].split(' ')
    end
    input
  end

  def self.count_unique_numbers(input)
    unique_digits = 0

    input.each_value do |digits|
      digits.each do |number|
        if [2, 3, 4, 7].include?(number.size)
          unique_digits += 1
        end
      end
    end
    unique_digits
  end

  def self.calc_and_sum_output_values(file)
    raw = File.readlines(file)
    sum = 0

    raw.each do |line|
      sum += SevenSegment.new(line).decode_output
    end
    sum
  end
end


#puts (Day8.count_unique_numbers(Day8.load_input('../data/JoDay8.txt')))
puts Day8.calc_and_sum_output_values('../data/JoDay8.txt')
