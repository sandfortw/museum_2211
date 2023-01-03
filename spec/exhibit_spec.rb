require './lib/exhibit'

RSpec.describe Exhibit do

  before(:each) do 
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end
  it 'exists' do
    expect(@exhibit).to be_an(Exhibit)
  end
  
  it 'has attributes' do
    expect(@exhibit.name).to eq("Gems and Minerals")
    expect(@exhibit.cost).to eq 0
  end
end
