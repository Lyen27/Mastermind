
class Board
  attr_accessor :state, :output
  def initialize
    @state = Array.new(12) {Array.new(4) {'grey'}}
    @output = Array.new(4,'grey') 
    @code = ''
  end

  def render
    state.each do |row|
      line = ''
      row.each do |element|
        color = element.to_sym
        line += '⬤  '.colorize(color)
      end
      output.each do |element|
        color = element.to_sym
        line += '◉  '.colorize(color)
      end
      puts line
    end
    puts "\n" + '⬤  '.colorize(:green) + '⬤  '.colorize(:blue) + '⬤  '.colorize(:yellow) +
    '⬤  '.colorize(:magenta) + '⬤  '.colorize(:red) + '⬤  '.colorize(:white)
  end

  def generate_color_code
    colors = %w[green 
  end

end

