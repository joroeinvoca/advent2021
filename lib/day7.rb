

class Day7
  def self.load_data(file)
    raw = File.read(file)
    raw.split(',').map(&:to_i)
  end
end
