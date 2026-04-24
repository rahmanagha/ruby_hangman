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
    if guess == "solve"
      handle_full_word(secret, board)
      board.display
      return
    end
    feedback = secret.give_feedback(guess)
    handle_feedback(feedback, board, guess)
    board.display
  end

  def handle_feedback(feedback, board, guess)
    if feedback == false
      puts "Please enter a valid letter(a-z)"
    elsif feedback.empty?
      board.handle_incorrect_letter(guess)
    else
      board.update_secret_word(feedback, guess)
    end
  end

  def handle_win
    puts "You won, but I will get him next time"
  end

  def handle_full_word(secret, board)
    puts "Predict full word:"
    answer = gets.chomp.downcase
    if secret.check_full_word(answer)
      board.update_to_full_word(answer)
    else
      board.fill_incorrect_letter_array
    end
  end

  def handle_loss(secret)
    puts "I got him"
    puts "Secret word was #{secret.secret_word}"
  end
end