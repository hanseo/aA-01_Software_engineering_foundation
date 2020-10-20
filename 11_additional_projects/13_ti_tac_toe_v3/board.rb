class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, "_") }
  end

  def valid?(pos)
    pos.all? { |n| n >= 0 && n < @grid.length }
  end

  def empty?(pos)
    row, col = pos
    
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
    @grid.any? { |row| row.all?(mark) }
  end

  def win_col?(mark)
    @grid.transpose.any? { |col| col.all?(mark) }
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
  
    right.all?(mark) || left.all?(mark)
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.any? { |row| row.any?("_") }
  end

  def legal_positions
    arr = []
    (0...@grid.length).each do |i_1|
      (0...@grid.length).each do |i_2|
        arr << [i_1, i_2] if empty?([i_1, i_2])
      end
    end
    
    arr
  end
end


