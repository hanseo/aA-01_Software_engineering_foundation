class Player
  def get_move
    p "enter a position with coordinates separated with a space like `4 7`"
    pos = gets.chomp
    pos.split.map(&:to_i)
  end
end