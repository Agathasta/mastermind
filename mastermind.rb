class Mastermind
  def initialize
    @board = Board.new
  end

# Let Human decide who is who PLAYER [game -> player 2x with definitions & board]
    # puts "Who is codebreaker? (Human, Computer)"
    # @codebreaker = Player.new (gets.chomp, @board???)
# def play
    # get_combi_to_guess
    # get_guess
# get_combi_to_guess
  # if Human = @codebreaker
    # @combi_to_guess = let computer make random combi_to_guess (1..6) GAME
  # if Computer = @codebreaker
    # @combi_to_guess = get combi_to_guess from codemaker (1..6) GAME
# def get_guess
    # loop
      # @guess = @player.ask_guess
      # @analisis = check_guess
      # break if game_over? || winner?
      # @board.update_board(@guess, @analisis)
# check_guess
  # check if any positions are right(@guess)  GAME
  # check if any numbers are right(@guess)  GAME
# game_over?  GAME
    # msg with right answer
# winner? GAME
    # msg
end

class Codebreaker

## initialize(gets.chomp, board)
    # @codebreaker = gets.chomp
    # @board = board???
# ask_guess from @codebreaker PLAYER
    # if Human = @codebreaker
      # gets.chomp
    # if Computer = @codebreaker
      # calculate_guess
# calculate guess
end

class Board
  def initialize
    @board = ""
    @analisis = ""
    @round = 0
  end

  def update_board(guess, analisis)
    @board << guess
    @analisis += analisis
    @round += 1
    display
  end

  def display
    @round.times { |i| 
      puts "#{@board[-4 + i * 4]}  #{@board[-3 + i * 4]}  #{@board[-2 + i * 4]}  #{@board[-1 + i * 4]}\t
      #{@analisis}" 
    }
  end
end

game = Mastermind.new
# game.play
