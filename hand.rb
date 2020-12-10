require_relative 'modules'

class Hand
  include Scoring

  attr_accessor :cards, :points

  def initialize
    @cards = []
    @points = 0
  end

  def count_all_points
    if cards.count == 2
      cards.each do |card|
        self.points += scoring(card.value)
      end
    else
      self.points += scoring(cards[-1].value)
    end
  end

  def recalculate_points
    return unless ace

    self.points -= 10
  end

  protected

  def ace
    cards.find { |card| card.value == 'Т' }
  end
end
