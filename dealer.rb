class Dealer < Player
  def initialize
    super('dealer')
  end

  def choice_strategy
    recalculate_points if calc_amount > 21
    return 'take_card' if calc_amount < 17 && cards.count < 3
  end
end
