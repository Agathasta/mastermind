# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'color'

class Mastermind
  def initialize
    @board = Board.new
    @player = Player.new(who_is_codebreaker)
  end

  def who_is_codebreaker
    puts `clear`
    puts '  *** Mastermind Game ***  '.bright_magenta
    puts
    puts 'Who is the codebreaker?' 
    puts "[H]".magenta.bold + ' Human'
    puts "[C]".magenta.bold + ' Computer'
    gets.chomp.downcase
  end

  def play
    @secret_combination = @player.ask_secret_combination
    # puts "secret_combination = #{@secret_combination}"
    guess_codebreaker
  end

  def guess_codebreaker
    puts `clear`
    puts '  *** Mastermind Game ***  '.bright_magenta
    puts
    puts 'The combination consists of four digits between 1 - 6.'
    puts '(for example: 2562)'.white
    puts 'To quit enter ' + '[Q]'.magenta.bold
    puts
    loop do
      @guess = @player.ask_guess_codebreaker(@guess, @analisis)
      exit if @guess.downcase == 'q'
      @analisis = analize_guess
      @board.update_board(@guess, @analisis)
      sleep(1)
      break if game_over? || winner?
    end
  end

  def analize_guess
    @right_number = @secret_combination.scan(/[#{Regexp.quote(@guess)}]/).size
    @right_position = @secret_combination.chars.select.with_index { |c, i| c == @guess[i] }.size
    '!' * @right_position + '?' * (@right_number - @right_position) + '-' * (4 - @right_number)
  end

  def game_over?
    return unless @board.round == 12

    puts "GAME OVER. The right combination was #{@secret_combination}".red
    exit
  end

  def winner?
    return unless @guess == @secret_combination

    puts "CONGRATULATIONS!!! You found out the right combination in #{@board.round} rounds.".bright_green
    exit
  end
end

Mastermind.new.play
