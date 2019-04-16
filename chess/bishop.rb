require_relative 'slideable'
require_relative 'piece'

class Bishop < Piece
    include Slideable

    # def initialize
    #     super
    # end

    def symbol
        :B
    end

    protected

    def valid_dirs
        diagonal_dirs
    end
    
end