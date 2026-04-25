require_relative "validatable"

class Player

  KEY_WORDS = ["solve", "save", "quit"]

  include Validatable

  def initialize(guesses = [])
    @guesses = guesses
  end

  def self.from_yaml(guesses)
    self.new(guesses)
  end

  def to_hash
    {:guesses => @guesses}
  end

  def get_guess
    puts "Enter a letter(a-z): "
    input = nil
    loop do
      input = gets.chomp.downcase
      break if check_for_key_word(input)
      if valid_guess?(input) && !already_guessed?(input, @guesses)
        @guesses.push(input.downcase)
        break
      end
      puts "Invalid input! Please enter a letter(a-z)"
    end
    input
  end

  private

  def check_for_key_word(input)
    KEY_WORDS.include?(input)
  end
end