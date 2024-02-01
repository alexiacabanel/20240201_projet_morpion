require_relative 'board'

class Player
    attr_accessor :name, :symbol
  
    def initialize(name, symbol)
      @name = name
      @symbol = symbol
    end
  
    def play
      puts "#{@name}, à vous de jouer (ligne, colonne) :"
      choice = gets.chomp.split(',').map(&:to_i)
      choice
    end
  end
