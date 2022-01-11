

class Day6
  def self.load_data(file)
    raw = File.read(file)
    raw.split(',').map(&:to_i)
  end

  def self.add_days(fish_arr, days)
    days.times {fish_arr = age_fish(fish_arr)}
    fish_arr
  end

  def self.age_fish(fish_arr)
    new_fish = []
    baby_fish = 0

    fish_arr.each do |fish|
      if fish > 0
        new_fish << fish - 1
      elsif fish == 0
        new_fish << 6
        baby_fish += 1
      end
    end

    baby_fish.times { new_fish << 8 }
    new_fish
  end

  def self.count_all_fish(fish_arr, days)
    fish_bucket = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    fish_arr.each do |fish|
      fish_bucket[fish] += 1
    end

    days.times do
      baby_fish = fish_bucket[0]

      (1 .. 8).each do |i|
        fish_bucket[i - 1] = fish_bucket[i]
      end

      fish_bucket[6] += baby_fish

      fish_bucket[8] = baby_fish
    end

    fish_bucket.sum
  end
end

#puts Day6.add_days(Day6.load_data('../data/JoDay6.txt'), 80).size
puts Day6.count_all_fish(Day6.load_data('../data/JoDay6.txt'), 256)
