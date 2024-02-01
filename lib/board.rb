require_relative 'player'

class Board
    attr_accessor :grid
  
    def initialize
      @grid = Array.new(3) { Array.new(3, ' ') }
    end
  
    def afficher

      puts "  0 1 2"
      @grid.each_with_index do |line, i|
        print "#{i} "
        puts line.join('|')
      end
    end
  
    def placer_symbol(symbol, line, column)
      @grid[line][column] = symbol if case_valid?(line, column) && case_empty?(line, column)
    end
  
    def case_valid?(line, column)
      line.between?(0, 2) && column.between?(0, 2)
    end
  
    def case_empty?(line, column)
      @grid[line][column] == ' '
    end
  
    def grid_full?
      @grid.all? { |line| line.none?(' ') }
    end
  
    def line_win?(symbol)
      @grid.any? { |line| line.uniq.length == 1 && line[0] == symbol }
    end
  
    def column_win?(symbol)
      @grid.transpose.any? { |column| column.uniq.length == 1 && column[0] == symbol }
    end
  
    def diagonal_win?(symbol)
      diagonal_main = [@grid[0][0], @grid[1][1], @grid[2][2]]
      diagonal_secondary = [@grid[0][2], @grid[1][1], @grid[2][0]]
  
      diagonal_main.uniq.length == 1 && diagonal_main[0] == symbol ||
        diagonal_secondary.uniq.length == 1 && diagonal_secondary[0] == symbol
    end
  
    def partie_win?(symbol)
      line_win?(symbol) || column_win?(symbol) || diagonal_win?(symbol)
    end
  end
  