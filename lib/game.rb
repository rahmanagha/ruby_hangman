require_relative "board"
require_relative "secret_word"
require_relative "player"

class Game
  
  def play
    secret = SecretWord.new
    board = Board.new(secret.secret_word.length)
    player = Player.new
    board.display

    until board.won? || board.lost?
      turn(secret, board, player)
    end
    
    handle_win if board.won?
    handle_loss(secret) if board.lost?
  end

  def turn(secret, board, player)
    guess = player.get_guess
    feedback = secret.give_feedback(guess)
    if feedback == false
      puts "Please enter a valid letter(a-z)"
    elsif feedback.empty?
      board.handle_incorrect_letter(guess)
    else
      board.update_secret_word(feedback, guess)
    end
    board.display
  end

  def handle_win
    puts "You won, but I will get him next time"
  end

  def handle_loss(secret)
    puts "I got him"
    puts "Secret word was #{secret.secret_word}"
  end
end