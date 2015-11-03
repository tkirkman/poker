Card = Struct.new(:rank, :suit) do
  def to_s
    "#{rank.capitalize} of #{suit.capitalize}"
  end

  def ==(other_card)
    self.rank == other_card.rank
  end
end
