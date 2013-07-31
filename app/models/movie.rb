class Movie < ActiveRecord::Base
  def self.filtered(params)
    movies = Movie
    movies=movies.order("#{params[:sort]} ASC")
	movies.all
  end
end
