require_relative 'stepable'
require_relative 'piece'

class Knight < Piece
    include Stepable

    def symbol
        :N
    end

    def move_diffs
        start = self.pos
        new_positions = []
        all_moves = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [2, -1], [1, -2]] 
        all_moves.each do |move|
            x, y = move
            new_pos = [start[0] + x, start[1] + y]
             if valid_pos?(new_pos) && self.board[new_pos].is_a?(NullPiece)
                new_positions << new_pos
             end        
        end

        new_positions
    end

end