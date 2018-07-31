
module SteppingPiece
  KING_MOVES = [
    [1, 0],
    [-1, 0],
    [1, 1],
    [-1, 1],
    [-1, -1],
    [0,1],
    [0, -1],
    [1, -1]
  ].freeze

  KNIGHT_MOVES = [
    [2, 1],
    [2, -1],
    [1, 2],
    [-1, 2],
    [1, -2],
    [-1, -2],
    [-2, 1],
    [-2, -1]
  ].freeze

  def moves
    return knight_move if self.is_a?(Knight)
    return king_move if self.is_a?(King)

  end

  def knight_move
    possible_moves = []
    other_color = (self.color == :w ? :b : :w)

    KNIGHT_MOVES.each do |pos|
      new_pos = [self.pos[0] + pos[0], self.pos[1] + pos[1]]
      begin
        self.board.valid_pos?(new_pos)
        possible_moves << new_pos if self.board[new_pos].is_a?(NullPiece) || self.board[new_pos].color == other_color
      rescue
         next
      end
    end
    return possible_moves
  end

  def king_move
    possible_moves = []
    other_color = (self.color == :w ? :b : :w)

    KING_MOVES.each do |pos|
      new_pos = [self.pos[0] + pos[0], self.pos[1] + pos[1]]
      begin
        self.board.valid_pos?(new_pos)
        possible_moves << new_pos if self.board[new_pos].is_a?(NullPiece) || self.board[new_pos].color == other_color
      rescue
         next
      end
    end
    return possible_moves
  end
end
