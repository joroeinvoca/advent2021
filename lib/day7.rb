

class Day7
  def self.load_data(file)
    raw = File.read(file)
    raw.split(',').map(&:to_i)
  end

  def self.fuel_for_best_pos(crabs)
    fuel_totals = []
    for i in 0 .. crabs.size - 1 do
      fuel_totals << fuel_for_pos(crabs, i)
    end
    fuel_totals.min
  end

  def self.fuel_for_pos(crabs, position)
    fuel_total = 0
    for i in 0 .. crabs.size - 1 do
      fuel_total += (crabs[i] - position).abs
    end
    fuel_total
  end
end

#crabs = Day7.load_data('../data/JoDay7.txt')
#puts Day7.fuel_for_best_pos(crabs)
