class Deck
  SUITS = %i[hearts diamonds clubs spades]
  RANKS = %i[two three four five six seven eight nine ten jack queen king ace]

  attr_reader :cards

  def initialize
    @cards = RANKS.flat_map { |rank| SUITS.map {|suit| Card.new(rank, suit) } }.shuffle
  end

  def card_count
    cards.to_a.count
  end

  def draw(num=1)
    cards.pop(num)
  end

  def shuffle
    cards.shuffle
  end

end
