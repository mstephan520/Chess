require 'colorize'
require_relative 'cursor'
require_relative 'board'
require_relative 'valid_pos'

class Display
    include Valid_pos

    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board
        print_board

        render
    end

    def render

        while true 
            @cursor.get_input
            system('clear')
            pos = @cursor.cursor_pos
            print_board(pos)
        end

    end

    def print_board(pos = nil)
        puts "    a   b   c   d   e   f   g   h"
        puts "   --- --- --- --- --- --- --- ---"

        (0..7).each do |row|
            string = ''
            (0..7).each do |col|
                position = [row, col]
                
                if position == pos && @cursor.selected
                    string += @board[position].symbol.to_s.colorize(:background => :light_green) + ' | '
                elsif position == pos
                    string += @board[position].symbol.to_s.colorize(:background => :light_red) + ' | '
                else
                    string += @board[position].symbol.to_s + ' | '
                end
            end
            puts (8 - row).to_s + " | " + string + (8 - row).to_s
            puts "   --- --- --- --- --- --- --- ---"
        end
        puts "    a   b   c   d   e   f   g   h"
    end
end

board = Board.new
display = Display.new(board)