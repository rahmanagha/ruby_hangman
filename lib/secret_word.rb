class SecretWord
  def initialize
    @secret_word = get_secret_word
  end

  def get_secret_word
    words = File.readlines("./google-10000-english-words.txt", chomp: true)
    words.select { |word| word.length.between?(5, 12) }.sample
  end
end