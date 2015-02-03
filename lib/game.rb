class Game
  def initialize
    @board = Board.new
    @player = Player.new
    @computer = Player.new
    @all_moves_by_player = []
    @all_moves_by_computer = []
  end

  def welcome
    puts "Welcome to Command Line Tic Tac Toe."
    @player.get_username
    @player.choose_x_or_o
    @player.set_computer_x_or_o
  end

  def valid_move?
    @board.remaining_spaces.include?(@move)
  end

  def save_move(all_moves, current_move) #player
    all_moves << current_move.to_i
  end

  def player_move 
    @board.print_board
    @move = gets.chomp
    if valid_move?
      save_move(@all_moves_by_player, @move)
      @board.update_board_with(@move, @player.player_xo)
      @board.update_remaining_spaces(@move)
    else
      puts "'#{@move}' is not a valid move. Please enter one of the following boxes: #{@board.remaining_spaces}"
      player_move
    end
  end

  def computer_move 
    @board.print_board
    @move = @board.remaining_spaces.sample
    puts "The computer selected #{@move}"
    save_move(@all_moves_by_computer, @move)
    @board.update_board_with(@move, @player.computer_xo)
    @board.update_remaining_spaces(@move)
  end

  def check_for_winner(all_moves, player)
    for combination in @board.winning_combinations
      if all_moves.sort & combination == combination
        @board.print_board  
        puts "Tic Tac Toe! #{player} wins!"
        play_again
      end
    end
  end

  def cat_game
    puts "Cat game!"
  end

  def play_again
    puts "Would you like to play again? (Y/n)"
    response = gets.chomp.downcase
    new_game if response == "y" || response == "yes"
    abort("Thanks for playing.") if response == "n" || response == "no"
  end

  def new_game
    Game.new.play
  end

  def opening
    player_move
    computer_move
  end

  def middle_game
    3.times do 
      player_move
      check_for_winner(@all_moves_by_player, @player.username)
      computer_move
      check_for_winner(@all_moves_by_computer, @computer.username)
    end
  end

  def end_game
    player_move
    check_for_winner(@all_moves_by_player, @player.username)
    cat_game
    play_again
  end

  def play
    welcome
    opening
    middle_game
    end_game
  end
end
