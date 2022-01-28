

class Day9
  def self.load_data(file)
    raw = File.readlines(file).map(&:strip)

    raw.each { |line| line.each_char.map(&:to_i) }
  end
end
