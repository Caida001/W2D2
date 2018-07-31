class Piece
  attr_accessor :pos, :color, :board

  def initialize(pos, color, board)
    @pos = pos
    @board = board
    @color = color# :w or :b
  end

  def to_s
    "p"
  end

  def moves

  end
end
