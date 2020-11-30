class Game
  attr_accessor :bank, :result

  def initialize(deck, player, dealer)
    @bank = player.place_bet + dealer.place_bet
    2.times do
      player.cards << deck.take_card
      dealer.cards << deck.take_card
    end
  end
end
