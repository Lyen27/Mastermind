require 'colorize'
require 'colorized_string'
require_relative 'board'
require_relative 'player'
require_relative 'input'

class Game
  include Input
  attr_reader :board, :player
  attr_accessor :row
  def initialize
    @board = Board.new
    @player = Player.new
    @row = 0
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
  end
end

game = Game.new
game.start_turn



