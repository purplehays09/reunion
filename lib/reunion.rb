require './lib/activity'

class Reunion
  attr_reader :name, :activities
  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(name)
    activities << Activity.new(name)
  end

  def total_cost
    total = 0
    activities.each { |n| total += n.total_cost }
    total
  end
  
  def breakout
    response = {}
    activities.each do |activity|
      puts "\nactivities owed \n #{activity.owed}\n"
      if response == {}
        response = activity.owed.clone
        puts "response if \n #{response}\n"
      else
        response.merge(activity.owed.clone) do |k, left, right| 
          puts "\nk: #{k}\n\nleft: #{left}\n\nright:#{right}\n\n"
          left + right 
        end
        puts "response else \n #{response}\n"
      end
    end
    puts "\nresponse\n #{response}\n"
    response
  end
end

you = {
  "Mike" => 5,
  "Dave" => 4,
  "Josh" => 3,
}
me = {
  "Mike" => 5,
  "Dave" => 4,
}

# puts Hash.new().merge(you) { |k, left, right| left + right}

puts me.merge(you) { |k, left, right| left + right}