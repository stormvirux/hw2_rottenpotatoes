class Movie < ActiveRecord::Base
  def self.filtered(params)
    movies = Movie
    if params[:sort]=="title"
	movies=movies.order("title  ASC")
	else
	movies=movies.order("release_date  ASC")
	end
	movies.all
  end
end
