require 'byebug'

module SlidingPiece
  def moves
    possible_moves = []
    move_directions = move_dirs

    possible_moves.concat(horizontal_moves) if move_directions.include?(:horizontal)
    possible_moves.concat(vertical_moves) if move_directions.include?(:vertical)
    possible_moves.concat(diagonal_moves) if move_directions.include?(:diagonal)

    return possible_moves
  end


  def horizontal_moves
    possible_horizontal_moves = []

    other_color = (self.color == :w ? :b : :w)
    row = self.pos[0]

    (self.pos[1] - 1).downto(0).each do |col|
      # debugger
      possible_horizontal_moves << [row, col] if self.board[[row, col]].is_a?(NullPiece)
      if self.board[[row, col]].color == self.color
        break
      elsif self.board[[row, col]].color == other_color
        possible_horizontal_moves << [row, col]
        break
      end

    end

    (self.pos[1] + 1).upto(7).each do |col|
      # debugger
      possible_horizontal_moves << [row, col] if self.board[[row, col]].is_a?(NullPiece)
      if self.board[[row, col]].color == self.color
        break
      elsif self.board[[row, col]].color == other_color
        possible_horizontal_moves << [row, col]
        break
      end
    end
    return possible_horizontal_moves
  end

  def vertical_moves
    possible_vertical_moves = []

    other_color = (self.color == :w ? :b : :w)
    col = self.pos[1]

    (self.pos[0] - 1).downto(0).each do |row|
      # debugger
      possible_vertical_moves << [row, col] if self.board[[row, col]].is_a?(NullPiece)
      if self.board[[row, col]].color == self.color
        break
      elsif self.board[[row, col]].color == other_color
        possible_vertical_moves << [row, col]
        break
      end

    end

    (self.pos[0] + 1).upto(7).each do |row|
      # debugger
      possible_vertical_moves << [row, col] if self.board[[row, col]].is_a?(NullPiece)
      if self.board[[row, col]].color == self.color
        break
      elsif self.board[[row, col]].color == other_color
        possible_vertical_moves << [row, col]
        break
      end
    end
    return possible_vertical_moves
  end

  def diagonal_moves
    possible_diagonal_moves = []

    other_color = (self.color == :w ? :b : :w)
    row = self.pos[0]
    col = self.pos[1]


    (1..7).each do |i|
      begin
        self.board.valid_pos?([row+i, col+i])

        possible_diagonal_moves << [row+i, col+i] if self.board[[row+i, col+i]].is_a?(NullPiece)
        if self.board[[row+i, col+i]].color == self.color
          break
        elsif self.board[[row+i, col+i]].color == other_color
          possible_vertical_moves << [row+i, col+i]
          break
        end
      rescue
        break
      end
    end


    (1..7).each do |i|
      begin
        self.board.valid_pos?([row-i, col-i])

        possible_diagonal_moves << [row-i, col-i] if self.board[[row-i, col-i]].is_a?(NullPiece)
        if self.board[[row-i, col-i]].color == self.color
          break
        elsif self.board[[row-i, col-i]].color == other_color
          possible_vertical_moves << [row-i, col-i]
          break
        end
      rescue
        break
      end
    end


    (1..7).each do |i|
      begin
        self.board.valid_pos?([row+i, col-i])

        possible_diagonal_moves << [row+i, col-i] if self.board[[row+i, col-i]].is_a?(NullPiece)
        if self.board[[row+i, col-i]].color == self.color
          break
        elsif self.board[[row+i, col-i]].color == other_color
          possible_vertical_moves << [row+i, col-i]
          break
        end
      rescue
        break
      end
    end


    (1..7).each do |i|
      begin
        self.board.valid_pos?([row-i, col+i])

        possible_diagonal_moves << [row-i, col+i] if self.board[[row-i, col+i]].is_a?(NullPiece)
        if self.board[[row-i, col+i]].color == self.color
          break
        elsif self.board[[row-i, col+i]].color == other_color
          possible_vertical_moves << [row-i, col+i]
          break
        end
      rescue
        break
      end
    end

    return possible_diagonal_moves
  end



  def move_dirs
    if self.is_a?(Bishop)
      return [:diagonal]
    elsif self.is_a?(Rook)
      return [:horizontal, :vertical]
    elsif self.is_a?(Queen)
      return [:diagonal, :horizontal, :vertical]
    end
  end
end
