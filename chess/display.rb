require 'colorize'
require 'cursor'

class Display
    def initialize(board)
        @cursor = Cursor.new([0,0], board)

    end

    def render

    end
end