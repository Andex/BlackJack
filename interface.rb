class Interface
  attr_accessor :player, :dealer, :current_game

  def initialize
    @player = Player.new(start)
    @dealer = Dealer.new
    @current_game = Game.new(player, dealer)
  end

  def act(action)
    p "action = #{action}"
    case action
    when 1
      take_card
    when 2
      current_game.end_game
      p 'Карты диллера:'
      dealer.view_hand
      print 'Победитель ', current_game.winner
      if current_game.winner == player
        p "#{player.name}, Вы выиграли #{current_game.bank} долларов!"
      elsif current_game.winner == dealer
        p 'К сожалению, Вы проиграли'
      else
        p 'Ничья! Деньги из банка делятся пополам'
      end
      return p "Вы закончили игру с активом в #{player.bank} долларов" unless new_game?

      self.current_game = Game.new(player, dealer)
      first_choice
    end
    p 'Ход диллера...'
    dealer.choice_strategy
    act(choise_action)
  end

  def first_choice
    p "В Вашем банке #{player.bank} долларов, ставка на игру 10 долларов"
    raise p 'Вы не можете продолжать т.к. Ваш банк пуст' if player.bank.zero?

    action = choise_action
    raise p 'Нельзя открыть карты, пока диллер не сделал свой первый ход' if action == 2

    act(action)
  rescue RuntimeError => e
    e.message
    retry
  end

  protected

  def start
    p 'Здравствуйте, представьтесь, пожалуйста'
    gets.chomp
  end

  def choise_action
    p 'Сейчас Ваш ход', 'У Вас на руках следующие карты:'
    player.view_hand
    player.actions.each_with_index { |action, ind| p "#{ind + 1} - #{action}" }
    gets.chomp.to_i - 1
  end

  def take_card
    player.take_card(current_game.deck)
    p 'Теперь у Вас руках 3 карты:'
    player.view_hand
    p "В сумме #{player.amount} очков"
  rescue RuntimeError
    p 'У Вас уже 3 карты, больше брать нельзя'
    act(choise_action)
  end

  def new_game?
    p 'Хотите продолжить? Если да, введите 1, иначе 0'
    !gets.chomp.to_i.zero?
  end
end
