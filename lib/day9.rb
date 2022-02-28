

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

  def self.find_top_low_point_coords(data, rows, cols)
    low_points = []
    #top left
    point = data[0][0]
    if point < data[0][1] && point < data[1][0]
      low_points << [0, 0]
    end

    #top right
    point = data[0][cols-1]
    if point < data[0][cols-2] && point < data[1][cols-1]
      low_points << [0, cols-1]
    end

    for i in 1 .. cols - 2
      point = data[0][i]
      if point < data[0][i-1] && point < data[0][i+1] && point < data[1][i]
        low_points << [0, i]
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

  def self.find_bottom_low_point_coords(data, rows, cols)
    low_points = []
    # bottom left
    point = data[rows-1][0]
    if point < data[rows-2][0] && point < data[rows-1][1]
      low_points << [rows-1, 0]
    end

    #bottom right
    point = data[rows-1][cols-1]
    if point < data[rows-1][cols-2] && point < data[rows-2][cols-1]
      low_points << [rows-1, cols-1]
    end

    for i in 1 .. cols - 2
      point = data[rows-1][i]
      if point < data[rows-1][i-1] && point < data[rows-1][i+1] && point < data[rows-2][i]
        low_points << [rows-1, i]
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

  def self.find_side_low_point_coords(data, rows, cols)
    low_points = []
    for i in 1 .. rows - 2
      #left side (not first or last)
      point = data[i][0]

      if point < data[i][1] && point < data[i+1][0] && point < data[i-1][0]
        low_points << [i, 0]
      end

      #right side (not first or last)
      point = data[i][cols-1]

      if point < data[i][cols-2] && point < data[i+1][cols-1] && point < data[i-1][cols-1]
        low_points << [i, cols-1]
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

  def self.find_middle_low_point_coords(data, rows, cols)
    low_points = []
    for i in 1 .. rows - 2
      for j in 1 .. cols - 2
        point = data[i][j]
        if point < data[i][j-1] && point < data[i][j+1] && point < data[i-1][j] && point < data[i+1][j]
          low_points << [i, j]
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

  def self.find_low_point_coords(data)
    rows = data.size
    cols = data[0].size

    low_points = []

    # might need to be low_points = low_points + (function)
    low_points += find_top_low_point_coords(data, rows, cols)

    #last row
    low_points += find_bottom_low_point_coords(data, rows, cols)

    #middles
    low_points += find_side_low_point_coords(data, rows, cols)
    low_points += find_middle_low_point_coords(data, rows, cols)
  end

  def self.mark_all_nines(data, processed_points)
    data.each_with_index do |row_val, row_ind|
      row_val.each_with_index do |col_val, col_ind|
        if col_val == 9
          processed_points[row_ind][col_ind] = 1
        end
      end
    end
    processed_points
  end

  def self.check_for_basin_edges(data, processed_points, coords)
    # check if we can go in any direction
    new_coords = []
    # up
    point_row = coords[0]
    point_col = coords[1]

    if point_row > 0 && processed_points[point_row - 1][point_col] == 0
      new_coords << [point_row - 1, point_col]
    end
    # right
    if point_col + 1 < processed_points[0].size && processed_points[point_row][point_col + 1] == 0
      new_coords << [point_row, point_col + 1]
    end
    # down
    if point_row < processed_points.size - 1 && processed_points[point_row + 1][point_col] == 0
      new_coords << [point_row + 1, point_col]
    end
    # left
    if point_col > 0 && processed_points[point_row][point_col - 1] == 0
      new_coords << [point_row, point_col - 1]
    end
    # return array of coords that we can check on
    new_coords
  end

  def self.find_all_basins(data)
    rows = data.size
    cols = data[0].size

    empty_processed_points = []
    rows.times { empty_processed_points << Array.new(cols, 0) }

    # mark all 9s as processed
    processed_points = mark_all_nines(data, empty_processed_points)

    low_points = find_low_point_coords(data)

    basin_sizes = []

    low_points.each do |low_coords|
      coords_to_check = [low_coords]
      basin_size = 0
      until coords_to_check.size == 0
        coords_to_check += check_for_basin_edges(data, processed_points, coords_to_check[0])
        if processed_points[coords_to_check[0][0]][coords_to_check[0][1]] != 1
          basin_size += 1
          processed_points[coords_to_check[0][0]][coords_to_check[0][1]] = 1
        end
        coords_to_check.delete_at(0)
      end
      basin_sizes << basin_size
    end

    basin_sizes
  end

  def self.search_complete(processed_points)
    processed_points.each do |row|
      if row.include?(0)
        return false
      end
    end
    true
  end

  def self.multiply_largest_basins(basins)
    basins.max(3).inject(:*)
  end
end

#puts Day9.sum_risk_level(Day9.load_data('../data/JoDay9.txt'))
