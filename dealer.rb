class Dealer < Player
  def initialize
    super('dealer')
  end

  # def choice_strategy
  #   amount = points.inject(0, :+)
  #   ace = ace_position
  #   if amount > 21 && ace
  #     points[ace] = 1
  #     choice_strategy
  #   elsif amount < 17 && cards.size < 3
  #     1
  #   else
  #     0
  #   end
  # end

  def choice_strategy
    recalculate_points if calc_amount > 21
    return 'take_card' if calc_amount < 17 && cards.count < 3
  end
end
