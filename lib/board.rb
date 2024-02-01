require_relative 'boardcase'
require_relative 'player'
require 'pry'

class Board
    attr_accessor :grid
  
    def initialize
      @grid = create_board_cases
    end

    def create_board_cases
      Array.new(3) { Array.new(3) { BoardCase.new(' ') } }
    end

    def update_board(row, column, value) #ici elle met à jour les cases avec les valeurs X et O
      @grid[row][column].value = value
    end
    
    #Affiche le plateau 
    def display_board
      puts "    1   2   3"
      puts "  -------------"
      @grid.each_with_index do |row, i| 
        print (i + 'A'.ord).chr + ' ' #.ord retourne le num de la lettre A (ascii)
        row.each { |cell| print "| #{cell.value} " } #pour chq ligne une valeur de case à attribuer
        puts "|"
        puts "  -------------" #sépare les lignes
      end
    end
    
end