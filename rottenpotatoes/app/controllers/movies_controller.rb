class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    puts 'session'
    puts session[:id]
    puts 'params'
    puts params[:id]
    if session[:id]
      flash[:notice] = "'#{Movie.find(session[:id]).title}' has no director info"
      session[:id] = nil
    end
    @movies = Movie.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  #new
  def find_similar
    puts "FIND SIMILAR!!!"
    @movie = Movie.find params[:id]
    puts "DIR: #{@movie.director}"
    if @movie.director == ''
      session[:id] = params[:id]
      redirect_to movies_path
    else
      @movies = Movie.find_similar_movies(@movie.director)
    end
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :director, :release_date)
  end
end
