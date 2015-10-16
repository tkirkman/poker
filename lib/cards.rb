class Cards
	SUITS = %i[hearts diamonds clubs spades]
	RANKS = %i[two three four five six seven eight nine ten jack queen king ace] 

	Card = Struct.new(:rank, :suit) do
		def to_s
			"#{rank.capitalize} of #{suit.capitalize}"
		end

		def ==(other_card)
			self.rank == other_card.rank
		end
	end

	def build
		RANKS.flat_map { |rank| SUITS.map {|suit| Card.new(rank, suit) } }
	end
end
