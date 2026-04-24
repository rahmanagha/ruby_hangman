require_relative "lib/game"
require "yaml"

puts "=" * 60
puts "  H A N G M A N"
puts "=" * 60
puts
puts "I've chosen a secret word. Can you guess it one letter at a time?"
puts
puts "HOW TO PLAY"
puts "  • Enter a single letter (a‑z) each turn to see if it's in the word."
puts "  • You can make up to 8 wrong guesses before the hangman is complete."
puts "  • Special commands (type them instead of a letter):"
puts "     solve  – guess the whole word (win instantly if correct, lose if wrong)"
puts "     save   – save your current game to a file"
puts "     quit   – exit with the option to save first"
puts "  • Duplicate guesses won't cost you a turn."
puts "  • At the start, you'll be able to resume a previously saved game."
puts
puts "Good luck!"
puts

def load_saved_game(saved_files, game, save_path)
  loop do
    puts "Write the name of save you want play without extension(.yaml)"
    file_name = gets.chomp.downcase
    if saved_files.include?("#{file_name}.yaml")
      saved_game = YAML.unsafe_load_file("#{save_path}/#{file_name}.yaml")
      game.continue(saved_game[:secret], saved_game[:board], saved_game[:player])
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      return false unless answer.downcase == "y"
      break
    end
    puts "Please enter a valid file name!"
  end
  true
end

def play_new_game(game)
  game.new_game
  puts "Would you like to play again? (y/n)"
  answer = gets.chomp
  answer.downcase == "y"
end

game = Game.new
save_path = File.join(__dir__, "saves")
loop do
  if Dir.exist?(save_path) && !Dir.empty?(save_path)
    puts "Do you want to continue playing saved game? (y/n)"
    input = gets.chomp
    if input.downcase == "y"
      saved_files = Dir["#{save_path}/*.yaml"].map {|item| item.split("/").last}
      puts "Saved files: #{saved_files.join(", ")}"
      break unless load_saved_game(saved_files, game, save_path)
    else
      break unless play_new_game(game)
    end
  else
    break unless play_new_game(game)
  end
end
puts "Goodbye"
