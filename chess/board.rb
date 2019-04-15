require_relative 'null_piece'
require_relative 'piece'
require "byebug"
require_relative 'valid_pos'


class Board
    include Valid_pos

    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) }
        place_pieces
    end

    def place_pieces
        @board[0..1].each do |row|
            row.map! { |square| Piece.new }
        end

        @board[2..5].each do |row|
            row.map! { |asquare| NullPiece.y }
        end

        @board[6..7].each do |row|
            row.map! { |square| Piece.new }
        end

    end

    def move_piece(start_pos, end_pos)
        raise "That's out of bounds." unless valid_pos?(start_pos)  
        raise "That's out of bounds." unless valid_pos?(end_pos)
            
        piece = self[start_pos]
        
        raise "There's no piece here." if piece.is_a?(NullPiece)  
        raise "There's already a piece here." unless self[end_pos].is_a?(NullPiece)

        self[end_pos], self[start_pos] = piece, NullPiece
        
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, value)2
        row, col = pos
        @board[row][col] = value
    end

end

# game1 = Board.new

# p game1.move_piece([1,0], [3, 0])
# p game1.move_piece([0,0], [4,4])
# p game1.board



