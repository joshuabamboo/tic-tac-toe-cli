require 'pry'
class Game

  def initialize
    @current_board = "1|2|3\n4|5|6\n7|8|9"
    @remaining_spaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @winning_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    @all_moves_by_player = []
    @all_moves_by_computer = []
  end

  def print_board
    puts @current_board
  end

  def player_move
    print_board
    @move = gets.chomp
    save_move(@all_moves_by_player, @move)
    update_board_with("X")
    update_remaining_spaces(@move)
  end

  def computer_move
    print_board
    @move = @remaining_spaces.sample
    puts "The computer selected #{@move}" #announcement
    save_move(@all_moves_by_computer, @move)
    update_board_with("O")
    update_remaining_spaces(@move)
  end

  def update_board_with(x_or_o)
    @current_board = @current_board.gsub(@move, x_or_o)
  end

  def update_remaining_spaces(move)
    @remaining_spaces.delete(move)
    @remaining_spaces
  end

  def save_move(all_moves, current_move)
    all_moves << current_move.to_i
  end

  def play
    player_move
    computer_move
    player_move
    computer_move
    player_move
    computer_move
    player_move
    computer_move
    player_move
    puts @current_board
  end

end

ttt=Game.new 
ttt.play