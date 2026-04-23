class Board
  
  def initialize(secret_word_length)
    @secret_word_array = Array.new(secret_word_length,"_")
    @incorrect_guesses_array = []
  end

  def display
    puts @secret_word_array.join
    puts "Incorrect guesses: #{@incorrect_guesses_array.join(", ")}"
  end

  def update_secret_word(indexes, guess)
    indexes.each do |index|
      @secret_word_array[index] = guess
    end
  end

  def handle_incorrect_guess(guess)
    @incorrect_guesses_array.push(guess)
  end

  def won?
    !@secret_word_array.include?("_")
  end

  def lost?
    @incorrect_guesses_array.length > 7
  end
end