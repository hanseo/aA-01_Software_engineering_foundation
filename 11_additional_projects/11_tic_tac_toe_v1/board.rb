class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, "_") }
  end

  def valid?(pos)
    pos.all? { |n| n >= 0 && n < 4 }
  end

  def empty?(pos)
    row = pos[0]
    col = pos[1]
    
    @grid[row][col] == "_"
  end

  def place_mark(pos, mark)
    row = pos[0]
    col = pos[1]

    if valid?(pos) && empty?(pos)
      @grid[row][col] = mark 
    else
      raise "Not a valid position"
    end
  end

  def print
    @grid.each { |row| p row }
  end

  def win_row?(mark)
    @grid.any? { |row| row.all? { |el| el == mark } }
  end

  def win_col?(mark)
    @grid.transpose.any? { |col| col.all? { |el| el == mark } }
  end

  def win_diagonal?(mark)
    right = []
    left = []
    g_length = @grid.length
    
    (0...g_length).each do |i| 
      g_length -= 1
      right << @grid[i][i]

      left << @grid[i][g_length]
    end
  
    right.all? { |el| el == mark } || left.all? { |el| el == mark }
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.any? { |row| row.any? { |el| el == "_" } }
  end
end


