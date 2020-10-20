class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position
    p "Enter position: row col"
    pos = gets.split.map(&:to_i)
    raise "Invalid format" if pos.length != 2

    pos
  end
end