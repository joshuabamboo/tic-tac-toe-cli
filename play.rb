class Player
  def initialize
    @all_moves_by_player = []
  end
end

class Computer
  def initialize
    @all_moves_by_computer = []
  end
end

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


class Play
  def initialize
    @board = Board.new
    @player = Player.new
    @computer = Computer.new
    @all_moves_by_player = []
    @all_moves_by_computer = []
  end

  def welcome
    puts "Welcome to Command Line Tic Tac Toe."
    x_or_o_choice
  end

  def x_or_o_choice
    puts "Select which player you'd like to be? (x/o)"
    choice = gets.chomp.downcase
  end

  def x_or_o_computer
    "x" if x_or_o_choice == "o"
    "o" if x_or_o_choice == "x"
  end

  def valid_move? #game
    @remaining_spaces.include?(@move)
  end

  def save_move(all_moves, current_move) #player
    all_moves << current_move.to_i
  end

  def check_for_winner(all_moves) #game
    for combination in @winning_combinations
      if all_moves.sort & combination == combination
        @board.print_board  
        puts "Tic Tac Toe!"
        play_again
      end
    end
  end

  def play_again #game
    puts "Would you like to play again? (Y/n)"
    response = gets.chomp.downcase
    new_game if response == "y" || response == "yes"
    abort("Thanks for playing.") if response == "n" || response == "no"
  end

  def new_game #game
    ttt = Game.new
    ttt.play
  end

  def opening(starter)
    starter.move
  end

  def player_move 
    @board.print_board
    @move = gets.chomp
    if valid_move?
      save_move(@all_moves_by_player, @move)
      @board.update_board_with("X")
      @board.update_remaining_spaces(@move)
    else
      puts "'#{@move}' is not a valid move. Please enter one of the following boxes: #{@remaining_spaces}"
      player_move
    end
    #check_for_winner(@all_moves_by_player)
  end

  def computer_move 
    @board.print_board
    @move = @remaining_spaces.sample
    puts "The computer selected #{@move}" #announcement
    save_move(@all_moves_by_computer, @move)
    @board.update_board_with("O")
    @board.update_remaining_spaces(@move)
    #check_for_winner(@all_moves_by_player)
  end

  def play
    player_move
    computer_move
    play_again

    #welcome_message
    
    #opening(starter)

    #end_game
  end
end

ttt=Play.new
ttt.play