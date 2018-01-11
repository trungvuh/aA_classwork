class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def pick_a_spot
    puts "Please pick the coordinate: (i.e.(0,1))"
    input = gets.chomp.split(",")
    input.map! { |el| Integer(el) } #return [0,1]
  end

  def pick_number
    puts "What value do you wanna put here? "
    gets.chomp
  end
end
