class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position(legal_positions)
    p "Enter position: row col"
    pos = gets.split.map(&:to_i)

    if legal_positions.include?(pos)
      return pos
    else
      p "invalid position, try again"
      get_position(legal_positions)
    end
  end
end