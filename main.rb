require_relative "lib/game"

puts "=" * 60
puts "  H A N G M A N"
puts "=" * 60
puts
puts "I've chosen a secret word. Can you guess it one letter at a time?"
puts
puts "HOW TO PLAY"
puts "  • Enter a single letter (a‑z) each turn to see if it's in the word."
puts "  • You can make up to 8 wrong guesses before the hangman is complete."
puts "  • Type 'solve' (instead of a letter) to guess the whole word."
puts "    - Correct: you win instantly!"
puts "    - Wrong:   you lose immediately."
puts "  • Duplicate guesses won't cost you a turn."
puts
puts "Good luck!"
puts

game = Game.new
loop do
  game.play
  puts "Would you like to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase == "y"
end
puts "Goodbye"