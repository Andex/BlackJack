class Player
  attr_reader :name
  attr_accessor :bank, :action, :cards, :points

  def initialize(name)
    @name = name
    @bank = 100
    @action = ['Пас', 'Взять карту']
    @cards = []
    @points = 0
  end
end
