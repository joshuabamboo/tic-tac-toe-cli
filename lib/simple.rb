require 'pry'
class Game

  def initialize
    @current_board = "1|2|3\n4|5|6\n7|8|9" #board
    @remaining_spaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"] #board
    @winning_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]] #board
    @all_moves_by_player = [] #player
    @all_moves_by_computer = [] #computer
  end

  def print_board #board
    puts @current_board
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
    
    check_for_winner(@all_moves_by_player)
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

  def update_board_with(x_or_o) #board
    @current_board = @current_board.gsub(@move, x_or_o)
  end

  def update_remaining_spaces(move) #board
    @remaining_spaces.delete(move)
    @remaining_spaces
  end

  def save_move(all_moves, current_move) #player
    all_moves << current_move.to_i
  end

  def valid_move? #game
    @remaining_spaces.include?(@move)
  end

  def check_for_winner(all_moves) #game
    for combination in @winning_combinations
      if all_moves.sort & combination == combination
        print_board  
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

  def play #game
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