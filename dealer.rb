class Dealer < Player
  def initialize
    super('dealer')
  end

  def choice_strategy
    hand.recalculate_points if hand.points > 21
    return 'take_card' if hand.points < 17 && hand.cards.count < 3
  end
end
