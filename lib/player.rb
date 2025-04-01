class Player
  attr_accessor :guess
  def initialize
    @score = 0
    @guess = []
  end

  def play(move,row,board)
    position = move[1].to_i
    color = move[0]
    guess << [color,position - 1]
    board[row][position - 1] = color
  end
end