# frozen_string_literal: true

require 'pry'

depths = File.readlines('RaulDay1.txt').map(&:to_i)

total_increases = 0

for i in (0...depths.length - 3)
  if depths[i+3] > depths[i]
    total_increases += 1
  end

end

puts total_increases
