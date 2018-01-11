class Board

  attr_reader :size

  def initialize(size = 4)
    @rows = Array.new(size) { Array.new(size) }
    @size = size
  end

  def render
    header = "   #{(0...size).to_a.join("  ")}  "
    puts header
    rows.each_with_index do |row, i|
      puts "#{i}  " + "#{row.join(" ")}" + "  "
    end

  end

  def populate
    pairs = (size ** 2) / 2
    cards = Card.new.shuffle(pairs)

    rows.each do |i|
      rows[i].each do |j|
        self[i, j] = cards.pop
      end
    end
  end

  def hide(pos)
    self[pos].hide
  end

  def reveal(pos)
    if revealed?(pos)
      puts "Card's face is already up, please pick another one: "
    else
      self[pos].reveal
    end

    self[pos].value
  end

  def revealed?(pos)
    self[pos].revealed?
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, value)
    row, col = pos
    rows[row][col] = value
  end

  def won?
    @rows.all? do |row|
      row.all? { |card| card.revealed? }
    end
  end

end
