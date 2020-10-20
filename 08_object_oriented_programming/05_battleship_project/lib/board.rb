class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each do |arr| 
      puts arr.join(" ")
    end
  end

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    row, col = pos
    @grid[row][col]     
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(pos)
    if self[pos] == :S 
      self[pos] = :H
      p "you sunk my battleship!"
      return true
    end

    self[pos] = :X
    false
  end

  def place_random_ships
    percent = 0.25 * size
    until num_ships == percent
      pos = rand(0...@grid.length), rand(0...@grid.length)
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |arr|
      arr.map { |el| el == :S ? el = :N : el }
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
