require_relative "piece"
require 'singleton'

class NullPiece < Piece
  include Singleton
  def initialize(color='black', symbol=':n')
    @color = color
    @symbol = symbol
  end

  def to_s
    "n"
  end
end
