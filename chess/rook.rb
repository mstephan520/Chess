require_relative 'slideable'
require_relative 'piece'

class Rook < Piece
    include Slideable

    # def initialize
    #     super
    # end

    def symbol
        :R
    end

    protected

    def valid_dirs
        horizontal_dirs
    end
    
end