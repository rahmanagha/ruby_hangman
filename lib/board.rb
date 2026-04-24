require_relative "validatable"

class Board

  HANGMANPICS = ['', '
      ┌───┐     
          |  
          |
          |
          |
          |
    ══════╧══ ', '
      ┌───┐     
          |  
      O   |
          |
          |
          |
    ══════╧══
  ', '
      ┌───┐     
          |  
      O   |
      ║   |
          |
          |
    ══════╧══
  ', '
      ┌───┐     
          |  
      O   |
      ║\  |
          |
          |
    ══════╧══
  ', '
      ┌───┐     
          |  
      O   |
     /║\  |
          |
          |
    ══════╧══
    ','
      ┌───┐     
          |  
      O   |
     /║\  |
       \  |
          |
    ══════╧══
    ','
      ┌───┐     
          |  
      O   |
     /║\  |
     / \  |
          |
    ══════╧══
    ','
      ┌───┐     
      |   |  
      O   |
     /║\  |
     / \  |
          |
    ══════╧══
    '
  ]

  include Validatable

  def initialize(secret_word_length)
    @secret_word_array = Array.new(secret_word_length,"_")
    @incorrect_letters_array = []
  end

  def display
    puts HANGMANPICS[@incorrect_letters_array.length]
    puts "Word: #{@secret_word_array.join(" ")}"
    puts "Incorrect letters: #{@incorrect_letters_array.join(", ")}  #{@incorrect_letters_array.length}/8"
  end

  def update_secret_word(indexes, guess)
    all_guesses = @secret_word_array + @incorrect_letters_array
    return false if !valid_guess?(guess) || already_guessed?(guess, all_guesses)
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
end