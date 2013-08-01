class MoviesController < ApplicationController

 #def initialize
  #  @all_ratings=Movie.ratings
   # @ratings=@all_ratings
 #end
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @ratings=@all_ratings
	if params[:sort]==nil
	  params[:sort]={"G"=>1,"R"=>1,"PG-13"=>1,"PG"=>1}
	  @ratings=params[:sort].keys
	else
	  @ratings=params[:sort].keys
	end
	@all_ratings=Movie.ratings
	@sort=params[:sort]
	#if params[:ratings]
	 # @clicked=params[:ratings]
	#end
	if @sort =="title"
	  @movies=Movie.order("title  ASC")
	else 
	  @movies=Movie.order("release_date  ASC")
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
