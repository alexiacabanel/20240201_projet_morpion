require_relative 'board'
require_relative 'player'

class Game
    attr_accessor :board, :players, :player1, :player2
  
    def initialize
        @players = []
    
        puts "1er joueur"
        name1 = gets.chomp
        @player1 = Player.new(name1, "X")
        @current_player = @player1
        puts player1.name + " va jouer " + player1.symbol
    
        puts "2ème joueur"
        name2 = gets.chomp
        @player2 = Player.new(name2, "O")
        puts player2.name + " va jouer " + player2.symbol
    
        @players << @player1
        @players << @player2
        @board = Grid.new
      end

    def current_player
        if @current_player == @player1
           @current_player = @player2
        else
            @current_player = @player1
        end
    end
    
    def turn
        9.times do 
          if @board.victory? == false
            puts @board.display_board
          @board.play_turn(@current_player)
          current_player
          else
            break
          end
          puts @board.display_board
        end
        if @board.victory? == true
          current_player
          puts "#{@current_player.name} A GAGNÉ !"
        else
          puts "ÉGALITE"
        end
    end
  
end

