class Computer
  def initialize
    @all_moves_by_computer = []
  end

  def computer_move #comp or game
    print_board
    @move = @remaining_spaces.sample
    puts "The computer selected #{@move}" #announcement
    save_move(@all_moves_by_computer, @move)
    update_board_with("O")
    update_remaining_spaces(@move)
    check_for_winner(@all_moves_by_player)
  end

  def save_move(all_moves, current_move) #not dry; also in player class
    all_moves << current_move.to_i
end