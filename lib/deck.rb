class Deck
  attr_reader :cards

  def initialize
    @cards = cards.build
  end

  def card_count
    cards.count
  end

  def draw(num=1)
    cards.pop(num)
  end

  def shuffle
    cards.shuffle
  end

  private

  def cards
    @cards ||= Cards.new
  end
end
