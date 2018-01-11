require_relative 'player'
require_relative 'board'


class MemoryPuzzle

  def initialize(board, player)
    @board = board
    @player = player
  end

  def play
    @board.populate
    # @board.render

    until @board.won?
      @board.display
      first_guess = self.get_guess
      @board.flip_over(first_guess)
      @board.display
      second_guess = self.get_guess
      @board.flip_over(second_guess)
      @board.display

      if @rows[first_guess] != @rows[second_guess]
        @rows[first_guess] = "x"
        @rows[second_guess] = "x"
      end

    end

    puts "Congrats! You won!"
  end

  def get_guess
    pos = @player.guess #pos = [0,0]
    #row, col = pos # row = 0. col = 0
    #
    # until @rows[row][col] == "x"
    #   pos = @player.guess
    # end

  end

end

if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("T&J")
  board = Board.new
  MemoryPuzzle.new(board, player1).play
end
