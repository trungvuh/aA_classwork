class Card
  attr_reader :card

  CARD = (1..8).to_a * 2

  def initialize(face = false)

    @face = face
  end

  def hide
    @face = false
  end

  def shuffle_deck
    CARD.shuffle
  end

  # cards = self.shuffle.deck
  # cards.pop

  def reveal
    @face = true
  end


end
