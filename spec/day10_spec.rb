require 'rspec'
require_relative '../lib/day10'

describe 'day 10' do
  input = Day10.load_data('data/day10example.txt')
  context 'part 1' do
    it 'load data loads data' do
      expect(input.size).to eq(10)
    end

    it 'load data actual data' do
      expect(input[0]).to eq('[({(<(())[]>[[{[]{<()<>>')
    end

    it 'returns only corrupted lines' do
      expect(Day10.corrupt_lines(input)).to match_array(
                                              ['{([(<{}[<>[]}>{[]{[(<()>',
                                               '[[<[([]))<([[{}[[()]]]',
                                               '[{[{({}]{}}([{[{{{}}([]',
                                               '[<(<(<(<{}))><([]([]()',
                                              '<{([([[(<>()){}]>(<<{{']
                                            )
    end

    xit 'remove first matching pair' do
      expect(Day10.remove_matched_pair(input[0].chars)).to eq('[({(<()[]>[[{[]{<()<>>'.chars)
    end

    xit 'finds and removes open-close sets until mismatch found and returns first illegal char' do
      expect(Day10.find_incorrect_close_char(input[2])).to eq('}')
    end

    xit '5 complete lines' do
      expect(Day10.complete_lines(input).size).to eq(5)
    end
  end
end
