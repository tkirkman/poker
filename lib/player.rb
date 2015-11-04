class Player
  attr_accessor :cards, :amount
  attr_reader :name

  def initialize(name, amount)
    @name = name
    @amount = amount
    @cards = []
  end
end

