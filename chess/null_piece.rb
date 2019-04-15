require_relative 'piece'
require 'Singleton'

class NullPiece < Piece
    # include singleton
    def initialize
        @name = 'N'
    end
end