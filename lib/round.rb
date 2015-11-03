require 'poker_card'
require 'deck'
require 'player'
require 'detect_hand'
require 'hand_scoring'
require 'byebug'

class Round
  attr_accessor :amount, :players

  def initialize(players)
    @players = players
    @deck = Deck.new
    @community_cards = []
    @pot = []
  end

  def first
    hands = deal_cards(players)
  end

  def second
    flop = add_cards(3)
  end

  def third
    turn  = add_cards
  end

  def last
    river  = add_cards
    winning_order = HandScoring.call(score_hands)
    announce_winning_hand_order(winning_order)
  end

private
  attr_reader :deck

  def deal_cards(players)
    players.each do |p|
      p.cards.push(deal_hand).flatten
    end
  end

  def add_cards(num=1)
    @community_cards.push(deck.draw(num))
  end

  def deal_hand
    deck.draw(5)
  end

  def score_hands
    #HandScoring.call(hands)
    #hands = [{ name: 'player 1', cards: [PokerCard.new(:ace, :hearts), PokerCard.new(:ace, :spades), PokerCard.new(:ace, :diamonds), PokerCard.new(:ace, :clubs), PokerCard.new(:two, :clubs)]}, { name: 'player 2', cards: [PokerCard.new(:three, :spades), PokerCard.new(:four, :spades), PokerCard.new(:five, :spades), PokerCard.new(:six, :spades), PokerCard.new(:seven, :spades)]}]
    detect_hands = players.map do |p|
      {name: p.name, cards: p.cards}.merge(hand: DetectHand.new(p.cards.flatten).call)
    end
  end

  def return_cards
    players.each do |p|
      p.hand = []
    end
  end

  def announce_winning_hand_order(winning_order)
    winning_order.each do |order|
      p "#{order[:name]} finished next with a #{order[:hand]}"
    end
  end
end
