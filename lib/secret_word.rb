require_relative "validatable"

class SecretWord

  attr_reader :secret_word

  include Validatable

  def initialize
    @secret_word = get_secret_word
  end

  def get_secret_word
    words_path = File.join(__dir__, 'google-10000-english-words.txt')
    words = File.readlines(words_path, chomp: true)
    words.select { |word| word.length.between?(5, 12) }.sample
  end

  def give_feedback(guess)
    return false unless valid_guess?(guess)
    found_indexes = []
    @secret_word.split("").each_with_index do |letter, index|
      found_indexes.push(index) if guess.downcase == letter
    end
    found_indexes
  end

  def check_full_word(guess)
    guess == @secret_word
  end
end
