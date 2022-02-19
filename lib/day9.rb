

class Day9
  def self.load_data(file)
    raw = File.readlines(file).map(&:strip)

    output = []

    raw.each do |line|
      output_line = []
      line.each_char do |char|
        output_line << char.to_i
      end
      output << output_line
    end

    output
  end

  def self.sum_risk_level(data)
    find_lowest_points(data).map { |depth| depth + 1 }.sum
  end

  def self.find_top_low_points(data, rows, cols)
    low_points = []
    #top left
    point = data[0][0]
    if point < data[0][1] && point < data[1][0]
      low_points << point
    end

    #top right
    point = data[0][cols-1]
    if point < data[0][cols-2] && point < data[1][cols-1]
      low_points << point
    end

    for i in 1 .. cols - 2
      point = data[0][i]
      if point < data[0][i-1] && point < data[0][i+1] && point < data[1][i]
        low_points << point
      end
    end

    low_points
  end

  def self.find_bottom_low_points(data, rows, cols)
    low_points = []
    # bottom left
    point = data[rows-1][0]
    if point < data[rows-2][0] && point < data[rows-1][1]
      low_points << point
    end

    #bottom right
    point = data[rows-1][cols-1]
    if point < data[rows-1][cols-2] && point < data[rows-2][cols-1]
      low_points << point
    end

    for i in 1 .. cols - 2
      point = data[rows-1][i]
      if point < data[rows-1][i-1] && point < data[rows-1][i+1] && point < data[rows-2][i]
        low_points << point
      end
    end

    low_points
  end

  def self.find_side_low_points(data, rows, cols)
    low_points = []
    for i in 1 .. rows - 2
      #left side (not first or last)
      point = data[i][0]

      if point < data[i][1] && point < data[i+1][0] && point < data[i-1][0]
        low_points << point
      end

      #right side (not first or last)
      point = data[i][cols-1]

      if point < data[i][cols-2] && point < data[i+1][cols-1] && point < data[i-1][cols-1]
        low_points << point
      end
    end

    low_points
  end

  def self.find_middle_low_points(data, rows, cols)
    low_points = []
    for i in 1 .. rows - 2
      for j in 1 .. cols - 2
        point = data[i][j]
        if point < data[i][j-1] && point < data[i][j+1] && point < data[i-1][j] && point < data[i+1][j]
          low_points << point
        end
      end
    end
    low_points
  end

  def self.find_lowest_points(data)
    rows = data.size
    cols = data[0].size

    low_points = []

    low_points += find_top_low_points(data, rows, cols)

    #last row
    low_points += find_bottom_low_points(data, rows, cols)

    #middles
    low_points += find_side_low_points(data, rows, cols)
    low_points += find_middle_low_points(data, rows, cols)
  end

  def self.find_all_basins(data)
    rows = data.size
    cols = data[0].size

    processed_points = []
    rows.times { processed_points << Array.new(cols, 0) }

    until search_complete(processed_points) do
      # find points until we hit an edge or a 9
      for i in 0 .. rows - 1
        for j in 0 .. cols - 1
          if processed_points[i][j] == 0
            if data[i][j] < 9

            end
          end
        end
      end
    end

  end

  def self.search_complete(processed_points)
    processed_points.each do |row|
      if row.include?(0)
        return false
      end
    end
    true
  end
end

#puts Day9.sum_risk_level(Day9.load_data('../data/JoDay9.txt'))
