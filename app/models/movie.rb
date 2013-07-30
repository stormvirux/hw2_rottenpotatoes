class Movie < ActiveRecord::Base
  def self.filtered(params)
    movies = Movie
    movies = movies.order_by(params[:sort]) unless params[:sort].blank? or !VALID_SORTS.include?(params[:sort])
    movies.all
  end
end
