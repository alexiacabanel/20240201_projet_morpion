require_relative 'board'
require_relative 'player'

require 'pry'

class BoardCase
    attr_accessor :position, :value
   
    def initialize(position)
        @position = position
        @value = ' ' #la valeur de la case (X, O ou empty)
    end

    #Récupérer la valeur de la cellule
    def value
        @value
    end

    #Vérifier si la case est vide
    def empty?
        @value == ' '
    end

    def row
        @position[0]
    end
    
    def column
        @position[1].to_i
    end
    
end