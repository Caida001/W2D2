require "colorize"
require_relative "cursor"
require_relative "board"

class Display
  attr_accessor :board, :cursor

  def initialize (board = Board.new)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    (0..7).each do |row|
      (0..7).each do |col|
      #   if [row, col] == cursor.cursor_pos
      #     if cursor.selected
      #       print board.board[row][col].to_s.colorize(:green) + " "
      #     else
      #       print board.board[row][col].to_s.colorize(:red) + " "
      #     end
      #   else
      #     print board.board[row][col].to_s + " "
      #   end
      # end
      # puts "I am selected position: #{cursor.selected_pos}"
      # puts "I am curent position: #{cursor.cursor_pos}"
        if cursor.selected
         if [row, col] == cursor.cursor_pos && cursor.cursor_pos != cursor.selected_pos
          print board.board[row][col].to_s.colorize(:red) + " "
         elsif [row, col] == cursor.selected_pos
            print board.board[row][col].to_s.colorize(:green) + " "
         else
          print board.board[row][col].to_s + " "
         end
        else
          if [row, col] == cursor.cursor_pos
            print board.board[row][col].to_s.colorize(:red) + " "
          else
            print board.board[row][col].to_s + " "
          end
        end
      end
      puts ""
    end
  end

  def make_move
    render
    until false
      puts "#{cursor.cursor_pos}"
      cursor.get_input
      render
    end
  end

end
