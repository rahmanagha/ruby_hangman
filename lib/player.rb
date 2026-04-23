require_relative "validatable"

class Player

  include Validatable

  def initialize
    @guesses = []
  end

  def get_guess
    puts "Enter a letter(a-z): "
    input = nil
    loop do
      input = gets.chomp
      if valid_guess?(input) && !already_guessed?(input, @guesses)
        @guesses.push(input.downcase)
        break
      end
      puts "Invalid input! Please enter a letter(a-z)"
    end
    input.downcase
  end
end