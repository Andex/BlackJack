module Scoring
  POINTS = [1, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10].freeze

  def scoring(card)
    card = card_cleaning(card)
    if !card.match(/\d/).nil?
      POINTS[card.to_i]
    elsif card == 'Т'
      POINTS[1]
    else
      POINTS[10]
    end
  end

  def card_cleaning(card)
    clean_card = card.delete('+<>^<3')
    clean_card = '3' if clean_card.empty?
    clean_card
  end
end
