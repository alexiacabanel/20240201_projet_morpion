require_relative 'board'
require_relative 'player'

class Game
    def initialize
      puts "Bienvenue dans le jeu de Morpion!"
      @player_x = ask_name_and_symbol('player X', 'X')
      @player_o = ask_name_and_symbol('player O', 'O')
      @player_current = @player_x
      @plateau = Board.new
    end
  
    def play
      loop do
        @plateau.afficher
        choice = @player_current.play
        if @plateau.case_valid?(choice[0], choice[1]) && @plateau.case_empty?(choice[0], choice[1])
          @plateau.placer_symbol(@player_current.symbol, choice[0], choice[1])
  
          if @plateau.partie_win?(@player_current.symbol)
            @plateau.afficher
            puts "Félicitations, #{@player_current.name}! Vous avez gagné!"
            break
          elsif @plateau.grid_full?
            @plateau.afficher
            puts "Match nul!"
            break
          else
            change_player
          end
        else
          puts "Choix invalide. Veuillez réessayer."
        end
      end
    end
  
    def ask_name_and_symbol(name_default, symbol_default)
      print "Entrez le nom du joueur (par défaut: #{name_default}): "
      name = gets.chomp
      name = name_default if name.empty?
  
      print "Entrez le symbole du joueur (par défaut: #{symbol_default}): "
      symbol = gets.chomp
      symbol = symbol_default if symbol.empty?
  
      Player.new(name, symbol)
    end
  
    def change_player
      @player_current = (@player_current == @player_x) ? @player_o : @player_x
    end
  end
  