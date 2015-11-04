require 'byebug'
require 'poker_card'

module HandScoring
  extend self

  HAND_WINNING_ORDER = %i[ royal_flush straight_flush four_of_a_kind full_house flush straight three_of_a_kind two_pair one_pair high_card ]

  def call(hands)
      scoring_sort(hands)
  end

  private

  def scoring_sort(hand)
    hand.sort do |a, b|
      if a[:hand][0] == b[:hand][0]
        HAND_WINNING_ORDER.index(b[:hand][0]) <=> HAND_WINNING_ORDER.index(a[:hand][0])
        PokerCard::WINNING_ORDER.index(b[:hand][1]) <=> PokerCard::WINNING_ORDER.index(a[:hand][1])
      else
        HAND_WINNING_ORDER.index(a[:hand][0]) <=> HAND_WINNING_ORDER.index(b[:hand][0])
      end
    end
  end
end
