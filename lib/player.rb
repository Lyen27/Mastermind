class Player
  attr_accessor :guess
  def initialize
    @score = 0
  end

  def play(move,row,board)
    position = move[1].to_i
    color = move[0]
    board[row][position - 1] = color
  end
end