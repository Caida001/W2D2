require_relative "piece"

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) {Array.new(8)}
    populate_board
  end

  def populate_board
    (0..7).each do |i|
      (0..7).each do |j|
        if i <= 1 || i >= 6
          board[i][j] = Piece.new
        else
          board[i][j] = nil
        end
      end
    end
  end


  def [](pos)
    row, col = pos
    board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    board[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    raise "No Piece at start position" if self[start_pos] == nil
    #for error handling
    valid_pos?(start_pos)
    valid_pos?(end_pos)

    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
  end

  def valid_pos?(pos)
    raise "Invalid position" if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
    true 
  end
end
