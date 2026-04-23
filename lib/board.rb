require_relative "validatable"

class Board

  include Validatable
  
  def initialize(secret_word_length)
    @secret_word_array = Array.new(secret_word_length,"_")
    @incorrect_letters_array = []
  end

  def display
    puts "Word: #{@secret_word_array.join(" ")}"
    puts "Incorrect letters: #{@incorrect_letters_array.join(", ")}"
  end

  def update_secret_word(indexes, guess)
    return false if !valid_guess?(guess) || already_guessed?(guess)
    indexes.each do |index|
      @secret_word_array[index] = guess.downcase
    end
  end

  def handle_incorrect_letter(guess)
    @incorrect_letters_array.push(guess)
  end

  def won?
    !@secret_word_array.include?("_")
  end

  def lost?
    @incorrect_letters_array.length > 7
  end

  def already_guessed?(letter)
    @secret_word_array.include?(letter.downcase) || @incorrect_letters_array.include?(letter.downcase)
  end

end