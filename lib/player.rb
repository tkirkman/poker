class Player
  attr_accessor :cards, :hand, :amount
  attr_reader :name

  def initialize(name, amount)
    @name = name
    @amount = amount
    @hand = []
    @cards = []
  end
end

