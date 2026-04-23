require_relative "lib/game"

game = Game.new
loop do
  game.play
  puts "Would you like to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase == "y" 
end
puts "Goodbye"