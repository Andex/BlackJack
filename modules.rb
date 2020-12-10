module Scoring
  def scoring(card)
    if !card.match(/\d/).nil?
      card.to_i
    elsif card == 'Т'
      11
    else
      10
    end
  end
end
