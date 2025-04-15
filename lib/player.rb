class Player

  def play(move,board)
    position = move[1].to_i
    color = move[0]
    board[position - 1] = color
  end
end