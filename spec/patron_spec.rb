require './lib/patron.rb'

describe Patron do

  before(:each) do 
    patron_1 = Patron.new("Bob", 20)
  end

  it 'exists' do
    expect(patron_1).to be_a(Patron)
  end

  it 'has a name, spending money, and interests' do
    expect(patron_1.name).to eq 'Bob'
    expect(patron_1.interests).to eq []
    expect(patron_1.spending_money).to eq 20
  end

  it 'can add interest' do
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end