class Player
  attr_accessor :hand, :amount
  attr_reader :name

  def initialize(name, amount)
    @name = name
    @amount = amount
    @hand = []
  end
end

