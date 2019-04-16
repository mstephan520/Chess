module Slideable

    def horizontal_dirs
        HORIZONTAL_DIRS       
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        move_dirs
    end

    private 

    HORIZONTAL_DIRS = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

    def move_dirs
        all_moves = []
        dirs = HORIZONTAL_DIRS + DIAGONAL_DIRS
        valid_dirs.each do |pos|
            x, y = pos
            all_moves += grow_unblocked_moves_in_dir(x, y)
        end

        all_moves
    end

    def valid_dirs
        HORIZONTAL_DIRS + DIAGONAL_DIRS
    end


    def grow_unblocked_moves_in_dir(dx, dy)
        unblocked_moves = []
        x, y = @pos
        
        next_pos = [x + dx, y + dy]

        until !self.board[next_pos].is_a?(NullPiece)
            unblocked_moves << next_pos
            next_pos = [next_pos[0] + dx, next_pos[1] + dy]
        end

        if self.board[next_pos].is_a?(Piece)
            if valid_pos?(next_pos)
                piece = self.board[next_pos]
                if piece.color != self.color
                    unblocked_moves << next_pos
                end
            end
        end
        
        unblocked_moves
    end

    
end