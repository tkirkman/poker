require 'byebug'

class DetectHand

  def initialize(hand)
    @hand  = hand_sort(hand)
    @ranks = @hand.map(&:rank)
    @suits = @hand.map(&:suit)
  end

  def call
    royal_flush? ||
      straight_flush? ||
      four_of_a_kind? ||
      full_house? ||
      flush? ||
      straight? ||
      three_of_a_kind? ||
      two_pair? ||
      one_pair? ||
      high_card?
  end

private
attr_reader :hand, :ranks, :suits

  def royal_flush?
    return unless suits.uniq.count == 1 &&
      ranks == %i[ ten jack queen king ace ]
    :royal_flush
  end

  def straight_flush?
    return unless suits.uniq.count == 1 &&
      PokerCard::WINNING_ORDER.each_cons(5).to_a.include?(ranks)
    :straight_flush
  end

  def four_of_a_kind?
    return unless suits.uniq.count == 4 && ranks.uniq.count == 2
    :four_of_a_kind
  end

  def full_house?
    return unless ranks.uniq.count == 2
    :full_house
  end

  def flush?
    return unless suits.uniq.count == 1
    :flush
  end

  def straight?
    return unless PokerCard::WINNING_ORDER.each_cons(5).to_a.include?(ranks)
    :straight
  end

  def three_of_a_kind?
    return unless ranks.detect{|r| ranks.count(r) > 2}
    :three_of_a_kind
  end

  def two_pair?
    return unless ranks.map{|r| ranks.count(r) == 2}.
      select{|val| val == true}.count == 4
    :two_pair
  end

  def one_pair?
    return unless ranks.map{|r| ranks.count(r) == 2}.
      select{|val| val == true}.count == 2
    :one_pair
  end

  def high_card?
    @hand[4].to_s
  end

  def hand_sort(hand)
    hand.sort do |a, b|
      PokerCard::WINNING_ORDER.index(a.rank) <=> PokerCard::WINNING_ORDER.index(b.rank)
    end
  end
end
