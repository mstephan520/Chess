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

            pos = @cursor.cursor_pos

            print_board(pos)
        end

    end

    def print_board(pos = nil)
        puts "  1 2 3 4 5 6 7 8"
        puts "  ----------------"

        (0..7).each do |row|
            string = ''
            (0..7).each do |col|
                position = [row, col]
                if position == pos && @cursor.selected
                    string += @board[position].name.colorize(:background => :light_green) + '|'
                elsif position == pos
                    string += @board[position].name.colorize(:background => :light_red) + '|'
                else
                    string += @board[position].name + '|'
                end
            end
            puts (row + 1).to_s + "|" + string
            puts "  ----------------"
        end
    end
end

board = Board.new
display = Display.new(board)