module Input
  def get_player_move
    move = validate_input(gets.chomp)
    move.split(',')
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
    input
  end
end