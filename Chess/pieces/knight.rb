require_relative "../piece"
require_relative "../stepping_piece"
require_relative 'king'


class Knight < Piece
  include SteppingPiece
end
