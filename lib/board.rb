# frozen_string_literal: true

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
    puts "Round #{round}:".bright_magenta
    @round.times do |i|
      print "#{@board[0 + i * 4]}  #{@board[1 + i * 4]}  #{@board[2 + i * 4]}  #{@board[3 + i * 4]}\t\t"
      puts "#{@analisis[0 + i * 4]}  #{@analisis[1 + i * 4]}  #{@analisis[2 + i * 4]}  #{@analisis[3 + i * 4]}"
    end
    puts
  end
end
