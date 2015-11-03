class DetectHand

  def initialize(hand)
    byebug
    @hand  = hand_sort(hand[:cards])
    @ranks = @hand.map(&:rank)
    @suits = @hand.map(&:suit)
  end

  def call
    royal_flush? ||
      straight_flush? ||
      four_of_a_kind?
  end

private
attr_reader :hand, :ranks, :suits

  def royal_flush?
    return if ranks != %i[ ten jack queen king ace ]
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
    return :full_house if ranks.uniq.count == 2
  end

  def flush?
    return true if suits.uniq.count == 1
  end

  def straight?
    return true if PokerCard::WINNING_ORDER.each_cons(5).to_a.include?(ranks)
  end

  def three_of_a_kind?
    return true if ranks.detect{|r| ranks.count(r) > 2}
  end

  def two_pair?
    return true if ranks.map{|r| ranks.count(r) == 2}.
      select{|val| val == true}.count == 4
  end

  def one_pair?
    return true if ranks.map{|r| ranks.count(r) == 2}.
      select{|val| val == true}.count == 2
  end

  def high_card?
     return true
  end

  def hand_sort(hand)
    hand.sort do |a, b|
      PokerCard::WINNING_ORDER.index(a.rank) <=> PokerCard::WINNING_ORDER.index(b.rank)
    end
  end
end
