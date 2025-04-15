module Input
  def get_player_move(mode)
    case mode
      when 'codebreaker'
        puts 'Pick a color between green, blue, yellow, purple, red and white and then pick a position, for example: red,2'
        if row == 0
          board.code = board.generate_color_code
        end
        move = validate_input(gets.chomp) 
      when 'codemaker'
        set_code
        move = computer_input
    end
    move
  end

  def validate_input(input)
    colors = %w[red blue yellow green white purple]
    arr = colors.reduce([]) do |acc,color|
      i = 0
      4.times do
        i = i + 1
        acc << [color,i].join(',')
      end
      acc
    end
    while !arr.include?(input)
      puts "that's an invalid choice, try again"
      input = gets.chomp
    end
    input.split(',')
  end

  def pick_mode
    puts 'choose if you want to play as codemaker or codebreaker'
    gets.chomp
  end
  def set_code
    while board.code.any?('grey')
      player.play(validate_input(gets.chomp),board.code)
    end
  end

  def computer_input
    
  end
end