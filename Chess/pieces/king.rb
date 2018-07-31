require_relative "../piece"
require_relative "../stepping_piece"
require_relative 'knight'


class King < Piece
  include SteppingPiece
end
