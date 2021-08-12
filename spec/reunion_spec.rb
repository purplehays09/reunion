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

  it "can add multiple activities" do
    reunion.add_activity("Brunch")
    reunion.add_activity("Drinks")

    reunion.activities[0].add_participant("Maria", 20)
    reunion.activities[0].add_participant("Luther", 40)

    reunion.activities[1].add_participant("Maria", 10)
    reunion.activities[1].add_participant("Luther", 40)
    reunion.activities[1].add_participant("Dave", 95)
    
    
    expect(reunion.activities.length).to eq(2)
  end
  
  it "calculates total cost" do
    reunion.add_activity("Brunch")
    reunion.add_activity("Drinks")
  
    reunion.activities[0].add_participant("Maria", 20)
    reunion.activities[0].add_participant("Luther", 40)
  
    reunion.activities[1].add_participant("Maria", 10)
    reunion.activities[1].add_participant("Luther", 40)
    reunion.activities[1].add_participant("Dave", 95)

    expect(reunion.total_cost).to eq(205)
  end
  
  it "can return everyones bills" do
    reunion.add_activity("Brunch")
    reunion.add_activity("Drinks")
  
    reunion.activities[0].add_participant("Maria", 20)
    reunion.activities[0].add_participant("Luther", 40)
  
    reunion.activities[1].add_participant("Maria", 10)
    reunion.activities[1].add_participant("Luther", 40)
    reunion.activities[1].add_participant("Dave", 100)
  
    expect(reunion.breakout.values).to eq([50, 0, -50])
    
  end
  
  
end
