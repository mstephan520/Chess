module Valid_pos
    def valid_pos?(pos)
        row, col = pos
        row.between?(0, 7) && col.between?(0, 7)
    end
end