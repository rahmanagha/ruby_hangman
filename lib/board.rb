class Board
  
  def initialize(secret_word_length)
    @secret_word_array = Array.new(secret_word_length,"_")
    @incorrect_guesses_array = []
    @turn = 0
  end

  def display
    puts "Turn #{@turn}"
    puts @secret_word_array.join
    puts "Incorrect guesses: #{@incorrect_guesses_array.join(", ")}"
  end

  def update_secret_word(indexes, guess)
    indexes.each do |index|
      @secret_word_array[index] = guess
    end
  end

  def increment_turn
    @turn += 1
  end

  def handle_incorrect_guess(guess)
    @incorrect_guesses_array.push(guess)
  end
end