require './lib/reunion'
require './lib/activity'

RSpec.describe Reunion do
  let(:reunion) { Reunion.new("1406 BE")}

  it "has a name" do
    expect(reunion.name).to eq("1406 BE")
  end

  it "activities default to empty" do
    expect(reunion.activities).to be_empty
  end
  
  it "adds an activity" do
    reunion.add_activity("Brunch")

    expect(reunion.activities[0].name).to eq("Brunch")
  end
  
end
