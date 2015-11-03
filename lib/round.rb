require 'poker_card'
require 'deck'
require 'player'
require 'detect_hand'
require 'hand_scoring'

class Round

  def initialize(players)
    @players = players
    @deck = Deck.new
    @pot = []
  end

  def first
    hands = deal_hands(players)
  end

  def second
    flop = add_cards(3)
  end

  def third
    turn  = add_cards
  end

  def last
    river  = add_cards
    score_hands
    #winning_hand = HandScoring.call(score_hands).first
    #announce_winner(winning_hand)
  end

private
  attr_reader :deck
  attr_accessor :amount, :players

  def deal_hands(players)
    players.each do |p|
      p.hand.push(deal_hand)
    end
  end

  def add_cards(num=1)
    cards = deck.draw(num)
    players.each do |p|
      p.hand = p.hand + cards
    end
  end

  def deal_hand
    deck.draw(5)
  end

  def score_hands
    HandScoring.call(hands)
    #hands = [{ name: 'player 1', cards: [PokerCard.new(:ace, :hearts), PokerCard.new(:ace, :spades), PokerCard.new(:ace, :diamonds), PokerCard.new(:ace, :clubs), PokerCard.new(:two, :clubs)]}, { name: 'player 2', cards: [PokerCard.new(:three, :spades), PokerCard.new(:four, :spades), PokerCard.new(:five, :spades), PokerCard.new(:six, :spades), PokerCard.new(:seven, :spades)]}]
  end

  def return_cards
    players.each do |p|
      p.hand = []
    end
  end

  def announce_winner(hand)

  end

end
