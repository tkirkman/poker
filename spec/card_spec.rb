require "card"
require "deck"

describe "Create new cards" do
  let(:cards) { Deck.new }
  let(:all_cards) { cards.cards.map {|card| [card.rank, card.suit]} }

  it "Creates 52 cards" do
    expect(all_cards.count).to eq 52
  end

  it "Creates Two of Hearts" do
    card = all_cards.select {|rank, suit| [rank, suit] == [:two, :hearts]}
    expect(card.count).to eq 1
  end

  it "Creates Six of Clubs" do
    card = all_cards.select {|rank, suit| [rank, suit] == [:six, :clubs]}
    expect(card.count).to eq 1
  end

  it "Creates Jack of Diamonds" do
    card = all_cards.select {|rank, suit| [rank, suit] == [:jack, :diamonds]}
    expect(card.count).to eq 1
  end

  it "Creates Ace of Spades" do
    card = all_cards.select {|rank, suit| [rank, suit] == [:ace, :spades]}
    expect(card.count).to eq 1
  end

  it "Checks that another card does not match" do
    card1 = all_cards.select {|rank, suit| [rank, suit] == [:ace, :spades]}.flatten
    card2 = all_cards.select {|rank, suit| [rank, suit] == [:jack, :diamonds]}.flatten
    card3 = all_cards.select {|rank, suit| [rank, suit] == [:jack, :clubs]}.flatten
    expect(card1[0]).not_to eq card2[0]
    expect(card2[0]).to eq card3[0]
  end
end
