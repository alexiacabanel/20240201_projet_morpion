# require_relative 'board'

class Player
    attr_accessor :name, :symbol
  
    def initialize(name, symbol)
      @name = name
      @symbol = symbol
    end
 end

# require 'bundler'
# Bundler.require  

# class Player
#     attr_accessor :name, :symbol
  
#     def initialize(name, symbol)
#       @name = name
#       @symbol = symbol
#     end
#   end

# # class Player
# #   attr_accessor :name, :symbol

# #   def initialize(name)
# #     @name = name
# #   end
# # end

# # # ici pour stocker les instances de la classe plus haut d'ou l'array
# # class TicTacToe
# #   def initialize
# #     @players = []
# #   end

# #   def get_player_info(player_name)
# #     print "Entrez le nom du joueur #{player_name}: "
# #     name = gets.chomp
# #     #Utilise un 'X' si c'est le premier joueur (numéro 1) et l'autre ba le O
# #     symbol = (player_name == 1) ? 'X' : 'O'
# #     player = Player.new(name)
# #     player.symbol = symbol #ajoute le symbole au nom du joueur
# #     @players << player # ca le fous dans l'array
# #   end

# #   def play
# #     get_player_info(1) #nom du joueur +1 ( le 1 c'est X )
# #     get_player_info(2) # idem pour le 2 donc O

# #     puts "Le joueur 1 (#{@players[0].name}) a le symbole #{@players[0].symbol}" #1er name + symbole de l'array donc 0
# #     puts "Le joueur 2 (#{@players[1].name}) a le symbole #{@players[1].symbol}" #2er name + symbole de l'array donc 1

# #   end

# # end

# # TicTacToe.new.play
# # #j'appeller titac ( l'array)(new) qui appelle play ' info1/2'
# # #