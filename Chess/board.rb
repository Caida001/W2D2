require_relative "piece"
require_relative "null_piece"
require_relative "pieces/rook"
require_relative "pieces/king"
require_relative "pieces/bishop"
require_relative "pieces/queen"
require_relative "pieces/pawn"
require_relative "pieces/knight"
require 'byebug'


class Board
  attr_accessor :board, :sentinel

  def initialize
    @board = Array.new(8) {Array.new(8)}
    @sentinel = NullPiece.instance
    populate_board
  end
  # pos, color, board
  def populate_board
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    (0..7).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        if row == 0
          # debugger
          self[pos] = pieces[col].new([row, col], :w, self)
        elsif row == 1
          # debugger
          self[pos] = Pawn.new([row, col], :w, self)
        elsif row == 6
          # debugger
          self[pos] = Pawn.new([row, col], :b, self)
        elsif row == 7
          # debugger
          self[pos] = pieces[col].new([row, col], :b, self)
        else
          # debugger
          self[pos] = sentinel
        end
      end
    end
              # (0..7).each do |i|
    #   (0..7).each do |j|
    #     if i <= 1 || i >= 6
    #       # board[i][j] = Knight.new([i, j], :w, self)
    #       board[i][j] = pieces[j].new([i, j], :w, self)
    #     else
    #       board[i][j] = sentinel
    #     end
    #   end
    # end
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
    self[start_pos] = sentinel
    self[end_pos] = piece
    piece.pos = end_pos
  end

  def valid_pos?(pos)
    raise "Invalid position" if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
    true
  end
end
