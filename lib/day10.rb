
class Day10
  def self.load_data(file)
    File.readlines(file).map(&:strip)
  end

  # def self.find_incorrect_close_char(input_line)
  #   lefts = ['(', '[', '{', '<']
  #   rights = [')', ']', '}', '>']
  #
  #   input_chars = input_line.chars
  #
  #   until input_chars == remove_matched_pair(input_chars)
  # end
  #
  # def self.remove_matched_pair(input_chars)
  #   lefts = ['(', '[', '{', '<']
  #   rights = [')', ']', '}', '>']
  #
  #   input_chars.each_index do |i|
  #     if lefts.include?(input_chars[i]) && rights.include?(input_chars[i + 1])
  #       if lefts.find_index(input_chars[i]) == rights.find_index(input_chars[i + 1])
  #         input_chars.delete_at(i)
  #         input_chars.delete_at(i)
  #         return input_chars
  #       end
  #     end
  #   end
  # end
  #
  # def self.complete_lines(input)
  #   complete = []
  #   lefts = ['(', '[', '{', '<']
  #   rights = [')', ']', '}', '>']
  #   input.each do |line|
  #     match_chars = 0
  #     line.chars.each do |char|
  #       if lefts.include?(char)
  #         match_chars += 1
  #       elsif rights.include?(char)
  #         match_chars -= 1
  #       end
  #     end
  #     if match_chars == 0
  #       complete << line
  #     end
  #   end
  #   complete
  # end

  def self.remove_matching_pairs(chars)
    lefts = ['(', '[', '{', '<']
    rights = [')', ']', '}', '>']

    for i in 0 .. chars.size - 2
      # if current char and next char are a matched pair
      l_ind = lefts.find_index(chars[i])
      r_ind = rights.find_index(chars[i+1])
      if l_ind && r_ind && l_ind == r_ind
        # run it again without that pair
        chars.delete_at(i)
        chars.delete_at(i)
        chars = remove_matching_pairs(chars)
        return chars
      end
    end
    chars
  end

  def self.corrupt_lines(input)
    corrupt = []

    lefts = ['(', '[', '{', '<']
    rights = [')', ']', '}', '>']

    input.each do |line|
      puts "\nline: #{line}"
      chars = remove_matching_pairs(line.chars)
      puts "remaining chars: #{chars.join}"
      if (rights & chars).any?
        puts "putting the line in corruptville"
        corrupt << line
      end
    end
    corrupt
  end
end
