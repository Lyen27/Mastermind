
class Board
  attr_accessor :state, :output, :code
  def initialize
    @state = Array.new(12) {Array.new(4) {'grey'}}
    @output = Array.new(12) {Array.new(4) {'grey'}}
    @code = generate_color_code
  end

  def render
    state.each_with_index do |row,index|
      line = ''
      row.each do |element|
        case element
          when 'yellow'
            element = 'light_yellow'
          when 'purple'
            element = 'magenta'
        end
        color = element.to_sym
        line += '⬤  '.colorize(color)
      end
      output[index].each do |element|
        color = element.to_sym
        line += '◉  '.colorize(color)
      end
      puts line
    end
    puts "\n" + '⬤  '.colorize(:green) + '⬤  '.colorize(:blue) + '⬤  '.colorize(:light_yellow) +
    '⬤  '.colorize(:magenta) + '⬤  '.colorize(:red) + '⬤  '.colorize(:white) + "\n\n"
  end

  def generate_color_code
    colors = %w[green blue yellow purple red white]
    arr = []
    4.times do
      arr << colors[rand(6)]
    end
    arr
  end
  
  def render_code
    line = ''
    code.each do |element|
        case element
          when 'yellow'
            element = 'light_yellow'
          when 'purple'
            element = 'magenta'
        end
        color = element.to_sym
        line += '⬤  '.colorize(color)
    end
    line
  end

  def check_guess(guess,row)
    i = -1
    p = -1
    position_array = code.map do |color|
      p = p + 1
      [color,p]
    end
    arr = position_array.filter do |code_color| # i has to be incremented after first iteration
      i = i + 1 
      code_color == guess[i]
    end
    (arr.length).times do
      random = rand(4)
      while output[row][random] != 'grey'
        random = rand(4)
      end
      output[row][random] = 'red'
    end
    diff = [position_array - arr, guess - arr]
    diff[0].each do |code_color|
      diff[1].each do |color|
        if code_color[0] == color[0]
          color[0] = nil
          random = rand(4)
          while output[row][random] != 'grey'
            random = rand(4)
          end
          output[row][random] = 'white'
          break
        end
      end
    end
  end

end

