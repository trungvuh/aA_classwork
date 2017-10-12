class Array

  def my_uniq
    result = []
    self.each { |el| result << el unless result.include?(el) }
    result
  end

  def two_sum
    result = []

    (0...length - 1).each do |i|
      (i + 1...length).each do |j|
        result << [i, j] if self[i] + self[j] == 0
      end
    end
    result
  end

  def my_transpose
    result = Array.new(size) { [] }
    (0...length).each do |i|
      (0...length).each do |j|
        result[i][j] = self[j][i]
      end
    end
    result
  end

  def stock_picker
    start_date, end_date, value = 0,0,0
    return nil if self.any? { |i| i < 0 }
    (0...length - 1).each do |i|
      (i + 1...length).each do |j|
        checking = self[j] - self[i]

        if checking > value
          value = checking
          start_date = i
          end_date = j
        end

      end
    end

    value == 0 ? nil : [start_date, end_date]
  end
end
