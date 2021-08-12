require './lib/activity'

class Reunion
  attr_reader :name, :activities
  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(name)
    activities << Activity.new()
  end
  
end