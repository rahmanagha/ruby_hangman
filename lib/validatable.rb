module Validatable
  
  def already_guessed?(guess, guess_array)
    guess_array.include?(guess)
  end

  def valid_guess?(guess)
    ("a".."z").include?(guess.downcase)
  end
end