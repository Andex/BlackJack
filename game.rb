class Game
  attr_reader :bet
  attr_accessor :player, :dealer, :deck, :bank, :winner

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @deck = Deck.new
    @bet = player.place_bet
    game_start
  end

  def game_start
    @bank = bet + dealer.place_bet(bet)
    2.times do
      player.take_card(deck)
      dealer.take_card(deck)
    end
  end

  def end_game
    self.winner = who_winner
    if winner
      winner.bank += bank
    else
      player.bank += bet
      dealer.bank += bet
    end
  end

  def who_winner
    dealer_points = dealer.hand.points
    player.hand.recalculate_points if player.hand.points > 21
    player_points = player.hand.points
    if player_points < 22 && (player_points > dealer_points || dealer_points > 21)
      player
    elsif dealer_points < 22 && (player_points < dealer_points || player_points > 21)
      dealer
    end
  end
end
