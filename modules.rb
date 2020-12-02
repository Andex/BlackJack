module Scoring
  def scoring(card)
    card = card_cleaning(card)
    if !card.match(/\d/).nil?
      card.to_i
    elsif card == 'Т'
      11
    else
      10
    end
  end

  def card_cleaning(card)
    clean_card = card.delete('+<>^<3')
    clean_card = '3' if clean_card.empty?
    clean_card
  end
end
