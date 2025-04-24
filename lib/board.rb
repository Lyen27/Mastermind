
class Board
  attr_accessor :state, :output, :code
  def initialize
    @state = Array.new(12) {Array.new(4) {'grey'}}
    @output = Array.new(12) {Array.new(4) {'grey'}}
    @code = Array.new(4,'grey') 
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

  def format_array(arr)
    q = 0
    arr.map do |color|
      q = q + 1
      [color,q]
    end
  end

  def check_guess(code,guess,feedback)
    
    position_array = format_array(code)

    guess = format_array(guess)
    
    arr = position_array & guess

    (arr.length).times do |i|
      feedback[i] = 'red'
    end

    diff = [position_array - arr, guess - arr]
    diff[0].each do |code_color|
      diff[1].each do |color|
        if code_color[0] == color[0]
          color[0] = nil
          i = 0
          while feedback[i] != 'grey'
            i = i + 1
          end
          feedback[i] = 'white'
          break
        end
      end
    end
  end

end

