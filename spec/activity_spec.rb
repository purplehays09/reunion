require './lib/activity'

RSpec.describe Activity do
  let(:activity) {Activity.new("Brunch")}

  it "has a name" do
    expect(activity.name).to eq("Brunch")
  end
  
  it "returns an empty hash for participants by default" do
    expect(activity.participants).to eq({})  
  end
  
  it "adds a participant and their amount to the activity" do
    activity.add_participant("Maria", 20)
    
    expect(activity.participants).to eq({ "Maria" => 20 })  
  end
  
  it "returns a total cost for activity" do
    activity.add_participant("Maria", 20)
    
    expect(activity.total_cost).to eq(20)
  end
  
  it "handles multiple participants" do
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    
    expect(activity.participants.keys).to eq(["Maria", "Luther"])
    expect(activity.total_cost).to eq(60)
  end
  
  it "returns the split cost" do
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    
    expect(activity.split).to eq(30)
  end
  
  it "returns participants owed amount for activity" do
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    expect(activity.owed.values).to eq([10, -10])
  end
  
  
  
end
