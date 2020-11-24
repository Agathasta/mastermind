# Set up the board BOARD
# Set up the analizer (maybe ? for white, ! for red and - for empty) BOARD
# Let computer make random number combination (1..6) GAME
# Loop
#   Get number combination from player (1..6) GUESS
#   Check if any positions are right  BOARD
#   Check if any positions are right  BOARD
#   Set counter +1
#   Show answer GAME
#   Break if game is over GAME
# Show solution GAME

class Mastermind
  def initialize
    @board = Board.new
    @board.display
  end
  # def play
  #   @guess = Guess.new
  #   @board.board = @guess.ask_guess
  #   @board.display
  # end
end

class Guess
  # def ask_guess
  #   puts 'guess?'
  #   [gets.chomp]
  # end
end

class Board
  def initialize
    @board = %w[. . . .]
    @analisis = "- - - -"
    @round = 1
  end

  def display
    @round.times { puts "#{@board[0]}  #{@board[1]}  #{@board[2]}  #{@board[3]}\t#{@analisis}" }
  end
end

game = Mastermind.new
# game.play
