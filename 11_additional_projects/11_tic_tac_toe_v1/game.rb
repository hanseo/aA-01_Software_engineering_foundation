require_relative "board"
require_relative "human_player"

class Game
  def initialize(player_1_mark, player_2_mark)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark) 
    @board = Board.new
    @current_player = @player_1
  end

  def switch_turn
    @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(@current_player.get_position, @current_player.mark)
      if @board.win?(@current_player.mark)
        p "victory! #{@current_player} won"
        return
      else
        switch_turn
      end
    end

    p "Draw"
  end
end



