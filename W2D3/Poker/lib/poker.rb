require 'byebug'
class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

end

class Deck
  attr_reader :value, :cards, :deck
  CARDS = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  SUITS = [:D, :H, :S, :C]

  def initialize
    @cards = CARDS
    @deck = populate_deck(@cards)
    @deck.shuffle!
  end



  def deal_card(n = 1)
    n.times { @deck.pop }
  end

  def empty?
    @deck.empty?
  end

  def count
    @deck.count
  end

  def populate_deck(cards)
    arr = []
    SUITS.each do |suit|
      cards.each do |card|
        if card == "A"
          value = 14
        elsif card == "J"
          value = 11
        elsif card == "Q"
          value = 12
        elsif card == "K"
          value = 13
        else
          value = card.to_i
        end
        arr << Card.new(value, suit)
      end
    end
    arr
  end
  private

  def shuffle!
    @deck = @deck.shuffle
  end


end



class Hand
  def initialize
  end

  def calculate_value(value)
  end

  def calculate_rank
  end

  def discard_card(n)
  end

  def add_card(n)
  end

  def switch_card(n)
  end

end



class Player
  def initialize
  end

  def call
  end

  def raise
  end

  def fold
  end

  def bet
  end
end



class Game
  def initialize
  end

  def won?
  end

  def draw?
  end

  def play
  end

  def play_turn
  end
end
