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

  describe 'iteration 3' do
    before(:each) do
      @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      @imax = Exhibit.new({name: "IMAX",cost: 15})
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      @patron_1 = Patron.new("Bob", 0)
      @patron_1.add_interest("Gems and Minerals")
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_2 = Patron.new("Sally", 20)
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3 = Patron.new("Johnny", 5)
      @patron_3.add_interest("Dead Sea Scrolls")
    end

    it 'can have patrons' do
      expect(@dmns.patrons).to eq([])
    end

    it 'can admit patrons' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
    end

    it 'can sort patrons by exhibit interest' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons_by_exhibit_interest).to eq ({
          @gems_and_minerals=> [@patron_1],
          @dead_sea_scrolls=> [@patron_1, @patron_2, @patron_3],
          @imax => []
        })
    end

    it 'can have lottery contestants' do
      expect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls)).to eq([@patron_1, @patron_3])
    end
      
    it 'can draw a winner' do
      expect(@dmns.draw_lottery_winner(@dead_sea_scrolls)).to be_a(String)
      expect(@dmns.draw_lottery_winner(@gems_and_minerals)).to eq(nil)
    end

    it 'can announce a winner' do
      expect(@dmns.announce_lottery_winner(@imax)).to eq("Bob has won the IMAX exhibit lottery")
      expect(@dmns.announce_lottery_winner(@gems_and_minerals)).to eq("No winners for this lottery")
    end
  end

end