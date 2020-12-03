require_relative 'modules'

class Player
  include Scoring

  attr_reader :name
  attr_accessor :bank, :cards, :points

  def initialize(name)
    @name = name
    @bank = 100
  end

  def calc_amount
    points.inject(0, :+)
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
    if cards.count == 2
      cards.each do |card|
        points << scoring(card)
      end
    elsif points.count != cards.count
      points << scoring(cards[-1])
    end
  end

  def recalculate_points
    ace = ace_position
    return unless ace

    points[ace] = 1
    calc_amount
  end

  def view_hand
    cards.each { |card| p " #{card} " }
  end

  protected

  def ace_position
    points.index(11)
  end
end
