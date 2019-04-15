require 'colorize'

string = "aaaaaaa"

puts string.colorize(:background => :red)
puts string.colorize(:background => :red) + "bbbbb"

puts String.colors

