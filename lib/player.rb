class Player
  attr_accessor :player_xo, :computer_xo, :username
  
  def initialize
    @all_moves_by_player = []
    @all_moves_by_computer = []
    @player_xo = "X"
    @computer_xo = "O"
    @username = "The computer"
  end

  def get_username
    puts "Select a username"
    @username = gets.chomp
  end

  def choose_x_or_o
    puts "Select which player you'd like to be? (x/o)"
    choice = gets.chomp.upcase
    @player_xo = choice if x_or_o?(choice)
    if !x_or_o?(choice)
      puts "Invalid selection. Please enter 'x' or 'o'"
      choose_x_or_o
    end
  end

  def x_or_o?(selection)
    if selection == "X"
      true
    elsif selection == "O"
      true
    else
      false
    end
  end

  def set_computer_x_or_o
    @computer_xo = "X" if @player_xo == "O"
    @computer_xo = "O" if @player_xo == "X"
  end
end