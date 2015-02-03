# tic-tac-toe-cli
Play tic tac toe from your command line

This is a quick exercize in creating an object oriented ttt game.

Algorithm for checking for winning patterns:
- Start checking for wins after the third move, since before then it is impossible to have a winner
- Create an array of arrays that contains all winning combinations (winning_combinations)
- Create an array of all previous moves by each player (all_moves)
- Iterate through the winning_combinations and compare them to all previous moves by each player
- If the shared elements in all_moves and a winning combination are equal to the winning combination, then we have a winner.