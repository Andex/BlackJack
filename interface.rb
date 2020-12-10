class Interface
  attr_reader :actions
  attr_accessor :player, :dealer, :current_game

  def initialize
    @player = Player.new(start)
    @dealer = Dealer.new
    @current_game = Game.new(player, dealer)
    @actions = ['Пас', 'Взять карту', 'Открыть карты']
  end

  def act(action)
    case action
    when 0
      if dealer.hand.cards.count == 3
        p 'У дилера уже 3 карты, пасовать нельзя, Вы можете только открыть карты'
      else
        dealer_move
      end
      act(choise_action)
    when 1
      take_card
      dealer_move
      act(choise_action)
    when 2
      current_game.end_game
      p 'Карты диллера:'
      dealer.view_hand
      p "У него #{dealer.hand.points}, у Вас #{player.hand.points}"
      show_winner
      p "В Вашем банке #{player.bank} долларов, ставка на новую игру 10 долларов"
      return p "Вы закончили игру с активом в #{player.bank} долларов" unless new_game?

      return p 'У дилера закончились деньги, Вы выиграли всю партию' if dealer.bank.zero?

      self.current_game = Game.new(player, dealer)
      first_choice
    end
  end

  def dealer_move
    p 'Дилер делает ход...'
    action = dealer.choice_strategy
    dealer.take_card(current_game.deck) if action == 'take_card'
    p 'Карты дилера:'
    dealer.hand.cards.count.times { print '*' }
  end

  def first_choice
    raise 'Вы не можете продолжать т.к. Ваш банк пуст' if player.bank.zero?

    action = choise_action
    raise 'Нельзя открыть карты, пока диллер не сделал свой первый ход' if action == 2

    act(action)
  rescue RuntimeError => e
    p e.message
    retry
  end

  protected

  def start
    p 'Здравствуйте, представьтесь, пожалуйста'
    gets.chomp
  end

  def choise_action
    p '\\nСейчас Ваш ход', 'У Вас на руках следующие карты:'
    player.view_hand
    p "В сумме #{player.hand.points} очков, без пересчета имеющихся тузов"
    actions.each_with_index { |action, ind| p "#{ind + 1} - #{action}" }
    action = gets.chomp.to_i - 1
    raise 'Нет такого действия' if action.negative? || action > 2

    action
  rescue ArgumentError => e
    p e.message
    retry
  end

  def take_card
    player.take_card(current_game.deck)
    p 'Теперь у Вас на руках 3 карты'
  rescue RuntimeError
    p 'У Вас уже 3 карты, больше брать нельзя'
    act(choise_action)
  end

  def new_game?
    p 'Хотите продолжить? Если да, введите 1, иначе 0'
    !gets.chomp.to_i.zero?
  end

  def show_winner
    if current_game.winner == player
      p "#{player.name}, Вы выиграли #{current_game.bank} долларов!"
    elsif current_game.winner == dealer
      p 'К сожалению, Вы проиграли'
    else
      p 'Ничья! Деньги из банка делятся пополам'
    end
  end
end
