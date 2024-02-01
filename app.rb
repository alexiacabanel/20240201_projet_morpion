require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/player'

morpion = Game.new
morpion.play

puts "Voulez-vous jouer à nouveau (oui ou non) ?"
answer = gets.chomp
