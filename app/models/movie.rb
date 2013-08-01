class Movie < ActiveRecord::Base
  def self.ratings
	self.all(:select=>"DISTINCT(rating)").map(&:rating)
  end
  def self.disp
    self.where("rating.include?(:ratings)",{ratings: params[:ratings]})
  end
end
