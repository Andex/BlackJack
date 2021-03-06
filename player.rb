require_relative 'hand'

class Player
  include Scoring

  attr_reader :name
  attr_accessor :bank, :hand

  START_CAPITAL = 100

  def initialize(name)
    @name = name
    @bank = START_CAPITAL
  end

  def place_bet(bet = 10)
    self.bank -= bet
    bet
  end

  def take_card(deck)
    raise if hand.cards.count == 3

    hand.cards << deck.give_card
    hand.add_points
  end

  def view_hand
    hand.cards.each { |card| p " #{card.value + card.color} " }
  end
end
