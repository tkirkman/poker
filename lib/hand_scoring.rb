module HandScoring
  extend self

  WINNING_ORDER = %i[ royal_flush straight_flush four_of_a_kind full_house flush straight three_of_a_kind two_pair one_pair high_card ]

  def call(hands)
    hands.map do |h|
      { name: h[:name], cards: h[:cards], hand: DetectHand.new(h).call }
    end
  end

end
