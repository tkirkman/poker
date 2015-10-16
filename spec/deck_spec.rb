require 'deck'

describe "Create a new Deck" do
  let(:deck) { Deck.new }

  it "Create a new Deck object" do
    expect(deck.card_count).to eq 52
  end

  it "Deals one card" do
    deck.draw
    expect(deck.card_count).to eq 51
  end
	
  it "Deals three cards" do
    deck.draw(3)
    expect(deck.card_count).to eq 49
  end
end
