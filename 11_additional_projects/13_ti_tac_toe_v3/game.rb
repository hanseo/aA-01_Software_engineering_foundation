require_relative "board"
require_relative "human_player"
require_relative "computer_player"
class Game
  def initialize(board_size, marks)
    @players = marks.map do |k, v| 
      v ? ComputerPlayer.new(k) : HumanPlayer.new(k)
    end

    @current_player = @players[0]
    @board = Board.new(board_size)
  end

  def switch_turn
    @current_player = @players.rotate!.first
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark)
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



