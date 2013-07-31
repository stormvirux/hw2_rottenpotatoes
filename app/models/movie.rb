class Movie < ActiveRecord::Base
  def self.filtered(params)
    movies = Movie
    movies=movies.order("params[:sort] DESC")
	movies.all
  end
end
