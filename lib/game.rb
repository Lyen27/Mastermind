require 'colorize'
require 'colorized_string'
require_relative 'board'
require_relative 'player'
require_relative 'input'

class Game
  include Input
  attr_reader :board, :player
  attr_accessor :row, :win
  def initialize
    @board = Board.new
    @player = Player.new
    @row = 0
    @win = false
  end

  def fill_row
    while board.state[row].any?('grey')
      player.play(get_player_move,row,board.state)
      board.render
    end
  end
  
  def start_turn
    puts 'Pick a color between green, blue, yellow, purple, red and white and then pick a position, for example: red,2'
    fill_row
    board.check_guess(player.guess,row)
    board.render
    player.guess = []
    self.win = true if board.output[row] == %w[red red red red]
    self.row += 1
  end

  def start_game
    while win == false
      start_turn
      if row == 12
        puts "The code maker won this time, the code was #{board.render_code}"
        return
      end
    end
    puts 'Congratulations!, you cracked the code'
  end
end

game = Game.new
game.start_game



