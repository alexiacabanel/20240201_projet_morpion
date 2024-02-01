require_relative 'game'
require_relative 'player'
require_relative 'boardcase'

class Grid
    attr_accessor :grid
    
    def initialize
        @grid = []

        9.times do |i|
            @grid << Grid_case.new("case#{i+1}").symbol
        end
    end

    def play_turn(player)
        puts "Sur quelle case veux-tu aller #{player.name} ? "
        case_number = gets.chomp.to_i
        if @grid[(case_number-1)] == " "
         @grid[(case_number-1)] = player.symbol
        else
         puts "Pas dispo"
         play_turn(player)
        end
       end
    
    def display_board
        puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
        puts "-----------"
        puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
        puts "-----------"
        puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    end
    
    def victory?
        if @grid[0] == @grid[1] && @grid[0] == @grid[2] && @grid[0] != " " ||  @grid[3] == @grid[4] && @grid[3] == @grid[5] && @grid[3] != " " || @grid[6] == @grid[7] && @grid[6] == @grid[8] && @grid[6] != " "  || @grid[0] == @grid[3] && @grid[0] == @grid[6] && @grid[0] != " " || @grid[1] == @grid[4] && @grid[1] == @grid[7] && @grid[1] != " "  || @grid[2] == @grid[5] && @grid[2] == @grid[8] && @grid[2] != " "  ||@grid[0] == @grid[4] && @grid[0] == @grid[8] && @grid[0] != " "  || @grid[2] == @grid[4] && @grid[2] == @grid[6] && @grid[2] != " " 
          return true
        else
          return false
        end
    end
    # WINNING_COMBINATIONS = [
    # [0, 1, 2], [3, 4, 5], [6, 7, 8], # lignes
    # [0, 3, 6], [1, 4, 7], [2, 5, 8], # colonnes
    # [0, 4, 8], [2, 4, 6]             # diagonales
    # ].freeze

    # def check_winner(symbol)
    #     WINNING_COMBINATIONS.any? do |combo| # en gros si ta un combo ,  avec any? sa renvoie vrai ( true)
    #         combo.all? { |index| @grid[index] == symbol } #avec combo.all? quand tu me tun symnbole dans ta grid , si sa correspond a un combo c'est bon
    #     end
    # end
    
end

# def joueur_joue(joueur)
#     puts "#{joueur}, veuillez choisir une position pour placer votre symbole (1-9) :"
#   position = gets.chomp.to_i
#   place_symbol(position, joueur) #place le symbole du jouer sur la grille
#   display_grid #Affiche la grille après que le joueur est joué

#   if check_winner(joueur)
#     puts "#{joueur} a gagné !"
#     exit 
#   end
# end