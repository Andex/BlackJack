require_relative 'modules'

class Player
  include Scoring

  attr_reader :name
  attr_accessor :bank, :action, :cards, :points

  def initialize(name)
    @name = name
    @bank = 100
    @action = ['Пас', 'Взять карту']
    @cards = []
    @points = []
  end

  def place_bet(bet = 10)
    @bank -= bet
    bet
  end

  def take_card(deck)
    @cards << deck.give_card
  end

  def count_all_points
    @cards.each do |card|
      @points << scoring(card)
    end
  end
end
