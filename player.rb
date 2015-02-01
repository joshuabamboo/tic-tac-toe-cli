class Player
  def initialize
    @all_moves_by_player = []
  end

  def player_move #player or game
    print_board
    @move = gets.chomp
    if valid_move?
      save_move(@all_moves_by_player, @move)
      update_board_with("X")
      update_remaining_spaces(@move)
    else
      puts "'#{@move}' is not a valid move. Please enter one of the following boxes: #{@remaining_spaces}"
      player_move
    end
    
    #check_for_winner(@all_moves_by_player)
  end

  def save_move(all_moves, current_move) #player
    all_moves << current_move.to_i
  end

  #add in choice of x or o method
  #add in whether you go first or second
end