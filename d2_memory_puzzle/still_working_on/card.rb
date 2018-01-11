class Card

  VALUES = ("A".."Z").to_a

  attr_reader :value :revealed

  def initialize(value, revealed = false)
    @value = value
    @revealed = revealed
  end

  def self.shuffle(pairs)
    values = VALUES

    values = values.sample(pairs) * 2
    values.shuffle!
    values.map { |val| self.new(val) }
    #change from an array of string items into an array of cards.
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def revealed?
    @revealed
  end

  def to_s #whenever we want to "puts" the value of the card, it will call the #to_s method
    revealed? ? "#{value}" : "_"
  end

  def ==(object)
    object.is_a?(self.class) && object.value = value
  end

end
