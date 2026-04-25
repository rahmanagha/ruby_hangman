require_relative "board"
require_relative "secret_word"
require_relative "player"
require "yaml"

class Game

  def initialize
    @game_over = false
  end

  def play(secret, board, player)
    @game_over = false
    board.display

    until board.won? || board.lost? || @game_over
      turn(secret, board, player)
    end
    
    handle_win if board.won?
    handle_loss(secret) if board.lost?
  end

   def new_game
    secret = SecretWord.new
    board = Board.new_game(secret.secret_word.length)
    player = Player.new
    play(secret, board, player)
   end

   def continue(secret, board, player)
    saved_secret = SecretWord.from_yaml(secret[:secret_word])
    saved_board = Board.from_yaml(board[:secret_word_array], board[:incorrect_letters_array])
    saved_player = Player.from_yaml(player[:guesses])
    play(saved_secret, saved_board, saved_player)
   end

  def turn(secret, board, player)
    guess = player.get_guess
    if guess == "solve"
      handle_full_word(secret, board)
      board.display
      return
    end
    if guess == "save"
      handle_save(secret, board, player)
      return
    end
    if guess == "quit"
      handle_quit(secret, board, player)
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

  def handle_save(secret, board, player)
    puts "Enter saved file name:"
    name = gets.chomp.downcase
    save_path = File.join(__dir__, "..", "saves")
    Dir.mkdir(save_path) unless Dir.exist?(save_path)
    file_path = File.join(save_path, "#{name}.yaml")
    File.open(file_path, "w+") do |f|
      f.write(to_yaml(secret, board, player))
    end
  end

  def  handle_quit(secret, board, player)
    puts "Would you like to save the game? (y/n)"
    answer = gets.chomp.downcase
    handle_save(secret, board, player) if answer == "y"
    @game_over = true
  end

  def to_yaml(secret, board, player)
    YAML.dump ({
      :secret => secret.to_hash,
      :board => board.to_hash,
      :player => player.to_hash
    })
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