require 'bundler'
Bundler.require

require_relative 'lib/board'
require_relative 'lib/boardcase'
require_relative 'lib/player'
require_relative 'lib/game'

puts "-------------------------------------------------"
puts "|              JOUONS AU MORPION !              |"
puts "|Soit gentil, mon crâne a explosé après ce code.|"
puts "-------------------------------------------------"
puts
puts "Le premier joueur aura les X et le deuxième les O"
puts
puts "Règles:"
puts "- Choisir où placer X ou O en tapant son numéro de case. (Exemples: B2)"
puts "- Réfléchissez."
puts "- Vainquez."
puts "- Ne pas trop se moquer du perdant" 
puts

game = Game.new
game.play
# game.continue

loop do
  puts "On rejoue? (Oui/Non)"
    new_game = gets.chomp
      if new_game == "Oui"
        game = Game.new
        game.play
      else
        puts "AU-RE-VOIR"    
      end
end