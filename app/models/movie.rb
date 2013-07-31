class Movie < ActiveRecord::Base
  def self.filtered(params)
    movies = Movie
    #movies=movies.all.title.sort 
	movies.all
  end
end
