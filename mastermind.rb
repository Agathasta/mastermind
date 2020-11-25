# frozen_string_literal: true

require 'pry'

class Mastermind
  def initialize
    @board = Board.new
    @player = Player.new(who_is_codebreaker)
  end

  def who_is_codebreaker
    puts 'Who is the codebreaker? (Human = h, Computer = c)'
    gets.chomp.downcase
  end

  def play
    @combi_codemaker = @player.ask_combi_codemaker
    # puts "combi_codemaker = #{@combi_codemaker}"
    guess_codebreaker
  end

  def guess_codebreaker
    loop do
      @guess_codebreaker = @player.ask_guess_codebreaker(@guess_codebreaker, @analisis)
      exit if @guess_codebreaker.downcase == 'q'
      @analisis = analize_guess
      @board.update_board(@guess_codebreaker, @analisis)
      break if game_over? || winner?
    end
  end

  def analize_guess
    @right_number = @combi_codemaker.scan(/[#{Regexp.quote(@guess_codebreaker)}]/).size
    @right_position = @combi_codemaker.chars.select.with_index { |c, i| c == @guess_codebreaker[i] }.size
    '!' * @right_position + '?' * (@right_number - @right_position) + '-' * (4 - @right_number)
  end

  def game_over?
    if @board.round == 12
      puts "GAME OVER. The right combination was #{@combi_codemaker}"
      exit
    end
  end

  def winner?
    if @guess_codebreaker == @combi_codemaker
      puts "CONGRATULATIONS!!! You found out the right combination in #{@board.round} rounds."
      exit
    end
  end
end

class Player
  def initialize(codebreaker)
    @codebreaker = codebreaker
  end

  def ask_combi_codemaker
    if @codebreaker == 'h'
      4.times.map { rand(1..6) }.join
    elsif @codebreaker == 'c'
      puts 'Enter a combination of four digits between 1 - 6. V.gr.: 2562'
      gets.chomp
    else
      exit
    end
  end

  def ask_guess_codebreaker(guess, analisis)
    if @codebreaker == 'h'
      puts 'Gimme a guess!'
      gets.chomp
    elsif @codebreaker == 'c'
      calculate_guess(guess, analisis)
    end
  end

  def calculate_guess(guess, analisis)
    if analisis.nil?
      @all_guesses = (1111..6666).map { |g| g.to_s }
      '1122'
    else
      @all_guesses.delete(guess)
      @all_guesses.select! { |g| 4 - (g.chars - guess.chars).size == analisis.count('?') + analisis.count('!') }
      @all_guesses[0]
    end
  end
end

class Board
  attr_reader :round

  def initialize
    @board = ''
    @analisis = ''
    @round = 0
  end

  def update_board(guess, analisis)
    @board += guess
    @analisis += analisis
    @round += 1
    display
  end

  def display
    @round.times do |i|
      print "#{@board[0 + i * 4]}  #{@board[1 + i * 4]}  #{@board[2 + i * 4]}  #{@board[3 + i * 4]}\t"
      puts "#{@analisis[0 + i * 4]}  #{@analisis[1 + i * 4]}  #{@analisis[2 + i * 4]}  #{@analisis[3 + i * 4]}"
    end
    puts
  end
end

game = Mastermind.new
game.play
