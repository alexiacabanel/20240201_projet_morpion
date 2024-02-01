require_relative 'boardcase'
require_relative 'board'
require_relative 'player'

require 'pry'

class Game
    attr_accessor :current_player, :board, :player1, :player2

    #Initialise une nouvelle partie, un plateau, 2 joueurs et le joueur actuel
    def initialize
        @board = Board.new
        @player1 = Player.new("Player_1", "X")
        @player2 = Player.new("Player_2", "O")
        @current_player = @player1
    end

    #Change de joueur
    def switch_player
        @current_player = (@current_player == @player1) ? @player2 : @player1
    end

    def turn
        board.display_board
        puts "Où veux-tu jouer? (ex: A1)"
        cell = gets.chomp.downcase
        if valid_move?(cell) #Chq coordonnée est vérifier. 
            row, column = cell[0].ord - 'a'.ord, cell[1].to_i - 1 #"a".ord soustrait à cell[0] pour pouvoir obtenir 0. cell[0] = A et son num est 65, le a est 97; pour que A = 0 et pas A = 65
            board.update_board(row, column, current_player.value) #Met à jour le plateau avec la valeur du joueur actuel (X ou O)
            switch_player
          else
            puts "Case invalide, veuillez réessayer."
        end
    end

    def valid_move?(cell)
        row, column = cell[0].ord - 'a'.ord, cell[1].to_i - 1
        (0..2).include?(row) && (0..2).include?(column) && board.grid[row][column].value == ' '
        #Les limites du plateau. Si les coordonnées rentré vont au dela, its a NO && Si la case est vide donc ok pour jouer = true sinon false
    end
    
    def game_over?
        # Vérifier les conditions de victoire
        if check_winner
          puts "#{current_player.name} remporte la partie !"
          return true
        end
      
        # Vérifier l'égalité
        if board_full?
          puts "Match nul ! Aucun gagnant."
          return true
        end
      
        # Si aucune condition de fin n'est remplie, le jeu continue
        return false
    end

    def check_winner
        # Vérifier les lignes et colonnes
        (0..2).each do |i|
          # Vérifier les lignes
          if board.grid[i][0].value == board.grid[i][1].value && board.grid[i][1].value == board.grid[i][2].value && !board.grid[i][0].empty?
            return current_player
          end
      
          # Vérifier les colonnes
          if board.grid[0][i].value == board.grid[1][i].value && board.grid[1][i].value == board.grid[2][i].value && !board.grid[0][i].empty?
            return current_player
          end
        end
      
        # Vérifier les diagonales
        if (board.grid[0][0].value == board.grid[1][1].value && board.grid[1][1].value == board.grid[2][2].value && !board.grid[0][0].empty?) ||
           (board.grid[0][2].value == board.grid[1][1].value && board.grid[1][1].value == board.grid[2][0].value && !board.grid[0][2].empty?)
          return current_player
        end
      
        # Aucun gagnant
        return nil
    end

    def board_full?
        board.grid.flatten.none?(&:empty?)
    end
      
    def play
        until game_over?
            turn
            board.display_board
        end
    end
end