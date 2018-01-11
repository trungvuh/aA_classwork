class Board

  def initialize
    @grid = Array.new(9) { Array.new(9) }
    # @setup = setup
  end

  def setup
    setup = []
    setup = File.readlines("sudoko1.txt").map { |line| setup << line }
    setup.map! do |string|
      string.split("")
    end

    (0..9).each do |i|
      (0..9).each do |j|
        @grid[i, j] = setup[i, j]

        tile.colorize_tile(@grid[i, j])
      end
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  # def position
  #
  # end

  def render
    header = "  0  1  2  3  4  5  6  7  8  9"
    puts header
    i = 0
    while i < 10
      puts "#{i}|  #{@grid[i].join('  ')}"
    end

  end

  def solved?
    if rows_check && column_check
      if cube_check
        true
      end
    end
    false
  end

  def rows_check
    @grid.each do |row|
      if row != row.unique || row.include?("0")
        false
      end
    end
    true
  end

  def column_check
    @grid.transpose.each do |row|
      if row != row.unique || row.include?("0")
        false
      end
    end
    true
  end

  def transpose
    transpose_grid = Array.new(9) { Array.new(9) }
    (0..9).each do |i|
      (0..9).each do |j|
        transpose_grid[i][j] = @grid[j][i]
      end
    end
    transpose_grid
  end

  def cube_check

  end

end

if $PROGRAM_NAME == __FILE__

end
