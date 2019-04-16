require_relative 'slideable'
require_relative 'piece'

class Queen < Piece
    include Slideable

    # def initialize
    #     super
    # end

    def symbol
        :Q
    end

    protected

end