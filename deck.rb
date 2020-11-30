class Deck
  VALUES ||= %w[2 3 4 5 6 7 8 9 10 В Д К Т].freeze
  COLORS ||= %w[+ <> ^ <3].freeze

  attr_accessor :cards

  def initialize
    @cards = []
    build_desk
  end

  def shuffle_deck
    @cards.shuffle
  end

  def take_card
    @cards.delete_at(0)
  end

  protected

  def build_desk
    COLORS.each do |color|
      VALUES.each do |value|
        @cards << value + color
      end
    end
  end
end
