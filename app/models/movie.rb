class Movie < ActiveRecord::Base
  def self.ratings
	self.all(:select=>"DISTINCT(rating)").map(&:rating)
  end
  
end
