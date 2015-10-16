require "cards"

describe "Create new cards" do
  let(:cards) { Cards.new.build }
  
  it "Creates 52 cards" do
    expect(cards.count).to eq 52
  end

  it "Creates Two of Hearts" do
    card = cards.select {|c| c.to_s == "Two of Hearts"}
    expect(card.count).to eq 1 
  end
	
  it "Creates Six of Clubs" do
    card = cards.select {|c| c.to_s == "Six of Clubs"}
    expect(card.count).to eq 1 
  end
	
  it "Creates Jack of Diamonds" do
    card = cards.select {|c| c.to_s == "Jack of Diamonds"}
    expect(card.count).to eq 1
  end
	
  it "Creates Ace of Spades" do
    card = cards.select {|c| c.to_s == "Ace of Spades"}
    expect(card.count).to eq 1
  end

  it "Checks that rank matches another rank" do
    card1 = cards[0] #Two of Hearts
    card2 = cards[1] #Two of Diamonds
    card3 = cards[10] #Four of Clubs
    expect(card1).to eq card2
    expect(card1).not_to eq card3
  end
end
