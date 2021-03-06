class MoviesController < ApplicationController

  def initialize
    @all_ratings=Movie.ratings
	  @ratings=@all_ratings
    @sort=:id
	  super
  end
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    @abc=session[:current_user_id]
    
    if params[:ratings]==nil
	    params[:ratings]={"G"=>1,"R"=>1,"PG-13"=>1,"PG"=>1}
	    @ratings=params[:ratings].keys
	  else
	    @ratings=params[:ratings].keys
	  end
	  @sort=params[:sort]
    
	  if @sort =="title"
      
	    @movies=Movie.order("title  ASC").where(rating: @ratings)
      
	  else 
      
	    @movies=Movie.where(rating: @ratings).order("release_date  ASC")
      
	  end
	   #@movies=Movie.disp
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
