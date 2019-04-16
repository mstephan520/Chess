require_relative 'stepable'
require_relative 'piece'

class King < Piece
    include Stepable

    def symbol
        :K
    end

    def move_diffs
        start = self.pos
        new_positions = []
        all_moves = [[0, 1], [1, 1], [1, 0], [0, -1], [-1, 0], [-1, -1], [1, -1], [-1, 1]] 
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