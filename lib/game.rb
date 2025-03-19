require 'colorize'
require_relative 'board'
require_relative 'player'
require_relative 'display'

class Game
  include Display
  attr_reader :board
  def initialize
    @board = Board.new
    @player = Player.new
  end

  def start_turn
    
  end
end

