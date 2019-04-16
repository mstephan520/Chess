require_relative 'piece'

class Pawn < Piece
    # def initialize
    #     super
    # end

    def symbol
        :P
    end

    def moves 
        move_dirs
    end

    def move_dirs
        all_moves = []
        next_pos = @pos
        delta = forward_dir
        forward_steps.times do
            next_pos = [next_pos[0] + delta, next_pos[1]]
            if valid_pos?(next_pos) && self.board[next_pos].is_a?(NullPiece)
                all_moves << next_pos
             end        
        end

        all_moves += side_attacks

        all_moves
    end

    private

    def at_start_row?
        if self.color == :white
            if self.pos[0] == 6
                return true
            end
        elsif self.pos[0] == 1
            return true  
        else
            return false
        end
    end

    def forward_dir
        if self.color == :black
            return 1
        else
            return -1
        end
    end

    def forward_steps
        if at_start_row?
            2
        else
            1
        end
    end 

    def side_attacks
        attacks = []
        left_side = [@pos[0] + forward_dir, @pos[1] - 1]
        right_side = [@pos[0] + forward_dir, @pos[1] + 1]

        if valid_pos?(left_side) 
            if @board[left_side].color != self.color && !@board[left_side].is_a?(NullPiece)
                attacks << left_side
            end
        end

        if valid_pos?(right_side) 
            if @board[right_side].color != self.color && !@board[right_side].is_a?(NullPiece)
                attacks << right_side
            end
        end

        attacks
    end
end