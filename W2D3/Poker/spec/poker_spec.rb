# Poker
#
# Today we will be using TDD to write a poker game, specifically five card draw.
#
# Learning Goals
#
# Be able to define desired functionality, write specs, and then
# implement
# Know how to follow red, green, refactor TDD workflow
# Know how to create and use test doubles
# Know when to use context and describe
# You'll want to use betterspecs as a cheatsheet/reference. You'll also
# want to refer to the reading on test doubles for help creating unit tests.
#
# Rules
#
# Each player is dealt five cards.
# Players bet; each player may fold, see the current bet, or raise.
# In turn, each player can choose to discard up to three cards.
# They are dealt new cards from the deck to replace their old cards.
# Players bet again.
# If any players do not fold, then players reveal their hands; strongest
# hand wins the pot.
# Design
#
# Classes you will want:
#
# Card
# Deck
# Request a TA Code review
# Hand
# The logic of calculating pair, three-of-a-kind, two-pair, etc. goes
# here.
# Logic of which hand beats which would go here.
# Player
# Each player has a hand, plus a pot
# Player has methods to ask the user:
# Which cards they wish to discard
# Whether they wish to fold, see, or raise.
# Game
# Holds the deck
# Keeps track of whose turn it is
# Keeps track of the amount in the pot.

require 'rspec'
require 'poker'



RSpec.describe Card do
  describe "#initialize" do
    subject (:card) { Card.new(10, :D) }

    it "should hold a value and a suit" do
      expect(card.value).to eq(10)
      expect(card.suit).to eq(:D)
    end

    it "values should be between 2-14" do
      expect(card.value).to be >= 2
      expect(card.value).to be <= 14
    end

    it "suit should be a symbol" do
      expect { throw card.suit }.to throw_symbol
    end
  end
end

RSpec.describe Deck do
    subject (:deck) { Deck.new}
    describe "#initialize" do
      it "should have 52 cards after being initialized" do
        expect(deck.count).to eq(52)
      end
    end

    describe "#"

    describe "#deal_card" do
      it "should be able to deal a number of cards" do
        deck.deal_card(3)
        expect(deck.count).to eq(49)
        deck.deal_card
        expect(deck.count).to eq(48)
      end
    end

    describe "#empty?" do
      it "should return true if deck is empty" do
        deck.deal_card(52)
        expect(deck).to be_empty
      end
    end

end
