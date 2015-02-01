class Board
  def initialize
    @current_board = "1|2|3\n4|5|6\n7|8|9"
    @remaining_spaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @winning_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end

  def print_board
    puts @current_board
  end

  def update_board_with(current_move, x_or_o) 
    @current_board = @current_board.gsub(current_board, x_or_o)
  end

  def update_remaining_spaces(move) 
    @remaining_spaces.delete(move)
    @remaining_spaces
  end
end