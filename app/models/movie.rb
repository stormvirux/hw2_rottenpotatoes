class Movie < ActiveRecord::Base
  def self.filtered(params)
    movies = Movie
    movies=movies.order("title  ASC")
	movies.all
  end
end
