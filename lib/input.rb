module Input
  def get_player_move(mode)
    case mode
      when 'codebreaker'
        self.randomize = true
        puts 'Pick a color between green, blue, yellow, purple, red and white and then pick a position, for example: red,2'
        if row == 0
          board.code = board.generate_color_code
        end
        validate_input(gets.chomp) 
      when 'codemaker'
        if row == 0
          puts 'choose a code selecting the color and the position, for example: red,1'
          set_code
        end
        computer_input
    end
  end

  def validate_input(input)
    arr = set_of_valid_inputs
    while !arr.include?(input)
      puts "that's an invalid choice, try again"
      input = gets.chomp
    end
    input.split(',')
  end

  def pick_mode
    puts 'choose if you want to play as codemaker or codebreaker'
    validate_mode = %w[codemaker codebreaker]
    mode = gets.chomp
    while !validate_mode.include?(mode)
      puts "That's an invalid mode"
      mode = gets.chomp
    end
    mode
  end
  def set_code
    while board.code.any?('grey')
      player.play(validate_input(gets.chomp),board.code)
    end
  end

  def computer_input
    input = computer_guess.shift
    if input == nil
      new_set = filter_set
      self.computer_guess = board.format_array(new_set[0])
      input = computer_guess.shift
    end
    input
  end

  def set_of_valid_inputs
    colors = %w[red blue yellow green white purple]
    arr = colors.reduce([]) do |acc,color|
      i = 0
      4.times do
        i = i + 1
        acc << [color,i].join(',')
      end
      acc
    end
    arr
  end

  def get_code_set
    colors = %w[red blue yellow green white purple]
    set = []
    colors.repeated_permutation(4) {|perm| set << perm}
    set
  end

  def filter_set
    code_set.filter! do |code|
      comparison_output = Array.new(4,'grey')
      board.check_guess(board.state[row - 1],code,comparison_output)
      board.output[row - 1] == comparison_output
    end
  end

end