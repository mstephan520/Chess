require_relative 'null_piece'
require_relative 'piece'
require_relative 'king'
require_relative 'queen'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'pawn'
require "byebug"
require_relative 'valid_pos'


class Board
    include Valid_pos

    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) }
        @sentinel = NullPiece.instance
        place_pieces
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @board[row][col] = value
    end

    def place_pieces
        black = [Rook.new(self, :black, [0,0]),
                 Knight.new(self, :black, [0, 1]), 
                 Bishop.new(self, :black, [0, 2]),
                 Queen.new(self, :black, [0, 3]),
                 King.new(self, :white, [0, 4]),
                 Bishop.new(self, :black, [0, 5]),
                 Knight.new(self, :black, [0, 6]),
                 Rook.new(self, :black, [0, 7])
                ]

        white = [Rook.new(self, :white, [7,0]),
                 Knight.new(self, :white, [7, 1]), 
                 Bishop.new(self, :white, [7, 2]),
                 Queen.new(self, :white, [7, 3]),
                 King.new(self, :white, [7, 4]),
                 Bishop.new(self, :white, [7, 5]),
                 Knight.new(self, :white, [7, 6]),
                 Rook.new(self, :white, [7, 7])
                ]

        @board[0] = black

        white_pawns = []
        @board[1].each.with_index do |square, idx|
            white_pawns << Pawn.new(self, :black, [1, idx])
        end

        @board[1] = white_pawns

        @board[2..5].each do |row|
            row.map! { |square| @sentinel }
        end

        black_pawns = []
        @board[6].each.with_index do |square, idx|
            black_pawns << Pawn.new(self, :white, [6, idx])
        end

        @board[6] = black_pawns


        @board[7] = white

    end

    def move_piece(start_pos, end_pos)
        raise "That's out of bounds." unless valid_pos?(start_pos)  
        raise "That's out of bounds." unless valid_pos?(end_pos)
            
        piece = self[start_pos]
        
        raise "There's no piece here." if piece.is_a?(NullPiece)  
        raise "There's already a piece here." unless self[end_pos].is_a?(NullPiece)

        self[end_pos], self[start_pos] = piece, NullPiece
    
    end

    def in_check?(color)

        king_pos = nil
        
        self.board.each do |row|
            row.each do |piece|
               king_pos = piece.pos if piece.is_a?(King) && piece.color == color
            end
        end

        self.board.each do |row|
            row.each do |piece|
                if !piece.is_a?(NullPiece) 
                    if piece.color != color
                        return true if piece.moves.include?(king_pos)
                    end
                    
                end
            end
        end

        false
    end

end

game1 = Board.new

# pos = [0, 4]
# king = game1[pos]
# p king.moves

# position = [0,6]
# puts game1[position]
# puts game1[position].class
# knight = game1[position]
# p knight.moves

# position2 = [1, 6]
# pawn = game1[position2]
# p pawn.moves

p game1.in_check?(:white)

