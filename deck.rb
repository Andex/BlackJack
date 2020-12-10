require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    build_desk
    shuffle_deck
  end

  def shuffle_deck
    @cards = @cards.shuffle
  end

  def give_card
    @cards.delete_at(0)
  end

  protected

  def build_desk
    Card::COLORS.each do |color|
      Card::VALUES.each do |value|
        @cards << Card.new(value, color)
      end
    end
  end
end
