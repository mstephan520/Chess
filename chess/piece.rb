require_relative 'valid_pos'

class Piece
    attr_reader :name, :pos, :board, :color

    include Valid_pos
    
    def initialize(board, color, pos)
        @name = :P
        @board, @color, @pos = board, color, pos
    end

    def valid_moves

    end

    def to_s

    end

    def empty?

    end

    def pos=(val)
        @board[pos] = val 
    end

    def symbol

    end

    private

    def move_into_check?(end_pos)
        
    end

end