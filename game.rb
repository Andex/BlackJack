class Game
  attr_reader :bet
  attr_accessor :player, :dealer, :deck, :bank, :winner

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @deck = Deck.new
    @bet = player.place_bet
    @bank = bet + dealer.place_bet(bet)
    game_start
  end

  def game_start
    player.cards = []
    dealer.cards = []
    player.points = []
    dealer.points = []
    2.times do
      player.cards << deck.give_card
      dealer.cards << deck.give_card
    end
    player.count_all_points
    dealer.count_all_points
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
    player.recalculate_points if player.amount > 21
    player.count_all_points
    player_points = player.amount
    dealer_points = dealer.amount
    if player_points < 22 && (player_points > dealer_points || dealer_points > 21)
      player
    elsif dealer_points < 22 && (player_points < dealer_points || player_points > 21)
      dealer
    end
  end
end
