require 'colorize'
require 'colorized_string'
require_relative 'board'
require_relative 'player'
require_relative 'input'

class Game
  include Input
  attr_reader :board, :player, :mode
  attr_accessor :row, :win
  def initialize
    @board = Board.new
    @player = Player.new
    @row = 0
    @win = false
    @mode = pick_mode
  end

  def fill_row
    while board.state[row].any?('grey')
      player.play(get_player_move(mode),board.state[row])
      board.render
    end
  end
  
  def start_turn
    fill_row
    board.check_guess(board.code,board.state[row],board.output[row])
    board.render
    self.win = true if board.output[row] == %w[red red red red]
    self.row += 1
  end

  def start_game
    while win == false
      if row > 11
        puts "The code maker won this time, the code was #{board.render_code}"
        return
      end
      start_turn
    end
    puts 'Congratulations!, you cracked the code'
  end
end

game = Game.new
game.start_game



