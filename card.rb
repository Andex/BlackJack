class Card
  attr_reader :value, :color

  VALUES ||= %w[2 3 4 5 6 7 8 9 10 В Д К Т].freeze
  COLORS ||= %w[+ <> ^ <3].freeze

  def initialize(value, color)
    @value = value
    @color = color
  end
end
