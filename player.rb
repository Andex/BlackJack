require_relative 'modules'

class Player
  include Scoring

  attr_reader :name
  attr_accessor :bank, :actions, :cards, :points, :amount

  def initialize(name)
    @name = name
    @bank = 100
    @actions = ['Пас', 'Взять карту', 'Открыть карты']
  end

  def place_bet(bet = 10)
    self.bank -= bet
    bet
  end

  def take_card(deck)
    raise if cards.count == 3

    cards << deck.give_card
    count_all_points
  end

  def count_all_points
    if cards.size == 2
      cards.each do |card|
        points << scoring(card)
      end
    elsif points.size != cards.size
      points << scoring(cards[-1])
    end
    self.amount = points.inject(0, :+)
  end

  def view_hand
    cards.each { |card| p " #{card} " }
  end

  protected

  def ace_position
    points.index(11)
  end
end
