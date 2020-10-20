class ComputerPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position(legal_positions)
    comp_pos = legal_positions.sample
    p "computer position: #{comp_pos}"
    comp_pos
  end
end