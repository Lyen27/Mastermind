require 'colorize'
require 'colorized_string'
require_relative 'board'
require_relative 'player'
require_relative 'input'

class Game
  include Input
  attr_reader :board, :player, :mode
  attr_accessor :row, :win, :computer_guess, :code_set, :randomize
  def initialize
    @board = Board.new
    @player = Player.new
    @row = 0
    @win = false
    @computer_guess = [['red',1],['red',2],['blue',3],['blue',4]]
    @code_set = get_code_set
    @mode = pick_mode
    @randomize = false
  end

  def fill_row
    while board.state[row].any?('grey')
      board.render
      player.play(get_player_move(mode),board.state[row])
    end
  end
  
  def start_turn
    fill_row
    board.check_guess(board.code,board.state[row],board.output[row])
    board.output[row].shuffle! if randomize
    self.win = true if board.output[row] == %w[red red red red]
    self.row += 1
  end

  def start_game
    while win == false
      if row > 11
        board.render
        puts "The code maker won this time, the code was #{board.render_code}"
        return
      end
      start_turn
    end
    board.render
    case mode
      when 'codebreaker'
        puts 'Congratulations!, you cracked the code'
      when 'codemaker'
        puts 'The codebreaker won this time'
    end
  end
end



