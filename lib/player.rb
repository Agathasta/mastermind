# frozen_string_literal: true

class Player
  def initialize(codebreaker)
    @codebreaker = codebreaker
  end

  def ask_secret_combination
    case @codebreaker
    when 'h'
      4.times.map { rand(1..6) }.join
    when 'c'
      puts 'Enter a combination of four digits between 1 - 6. V.gr.: 2562'
      gets.chomp
    else
      exit
    end
  end

  def ask_guess_codebreaker(guess, analisis)
    case @codebreaker
    when 'h'
      puts 'Gimme a guess!'
      gets.chomp
    when 'c'
      calculate_guess(guess, analisis)
    end
  end

  # using the Swaszek (1999-2000) strategy
  def calculate_guess(guess, analisis)
    if analisis.nil?
      @all_guesses = (1111..6666).map(&:to_s).reject { |g| g.include?('0') }
      '1122'
    else
      @all_guesses.delete(guess)
      @all_guesses.select! { |g| 4 - (g.chars - guess.chars).size == analisis.count('?') + analisis.count('!') }
      @all_guesses.select! do |g|
        g.chars.select.with_index { |c, idx| c == guess.chars[idx] }.size == analisis.count('!')
      end
      @all_guesses[0]
    end
  end
end
