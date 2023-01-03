require './lib/museum.rb'

describe Museum do 

  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  it 'exists' do
    expect(@dmns).to be_a(Museum)
  end

  it 'has a name and exhibit' do
    expect(@dmns.name).to eq "Denver Museum of Nature and Science"
    expect(@dmns.exhibits).to eq []
  end

  describe 'can add and recommend exhibits' do
    before (:each) do
      @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      @imax = Exhibit.new({name: "IMAX",cost: 15})
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
    end

    it 'can add exhibits' do
      expect(@dmns.exhibits).to eq [@gems_and_minerals, @dead_sea_scrolls, @imax]
    end

    it 'can recommend exhibit' do
      patron_1 = Patron.new("Bob", 20)
      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")
      patron_2 = Patron.new("Sally", 20)
      patron_2.add_interest("IMAX")
      expect(@dmns.recommend_exhibits(patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
      expect(@dmns.recommend_exhibits(patron_2)).to eq([@imax])
    end
  end

end