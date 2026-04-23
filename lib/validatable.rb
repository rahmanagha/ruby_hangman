module Validatable
  def valid_guess?(guess)
    ("a".."z").include?(guess.downcase)
  end
end