
class Board
  attr_accessor :state, :output, :code
  def initialize
    @state = Array.new(12) {Array.new(4) {'grey'}}
    @output = Array.new(12) {Array.new(4) {'grey'}}
    @code = %w[red red blue blue]
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
  
  def check_guess(guess,row)
    arr = code.map {|element| element}
    apply_correction = false
    (0..3).each do |code_index| #why it doesn't work with arr.each?
      code_index -= 1 if apply_correction
      apply_correction = false
        if arr[code_index] == guess[code_index]
          apply_correction = true
          arr.delete_at(code_index)
          guess.delete_at(code_index)
          random = rand(4)
          output[row][code_index] = 'red'
        end
      end
     p arr
     p guess
     (0..(arr.length - 1)).each do |code_index| #why it doesn't work with arr.each?
      code_index -= 1 if apply_correction
      apply_correction = false
        if arr[code_index] == guess[code_index]
          apply_correction = true
          arr.delete_at(code_index)
          guess.delete_at(code_index)
          random = rand(4)
          output[row][code_index] = 'white'
        end
      end
  end

end

