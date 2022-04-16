class MoviesController < ApplicationController
  def new
    @movie = Movie.new

    #render template: "movies/new" omit because folder name matches controller name
  end

  def index
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html 
    end
  end

  def show
    @movie = Movie.find(params.fetch(:id))
  end

  def create
    movie_attributes = params.require(:movie).permit(:title, :description) #:movie is a hash contain multiple movie attributes
    @movie = Movie.new(movie_attributes)
  
    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully." 
    else
      render "movies/new" #only dropped folder because action doesn't make template name
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))

    render template: "movies/edit"
  end

  def update
    @movie = Movie.find( params.fetch(:id))
    @movie.attributes = params.require(:movie).permit(:title, :description)

    if @movie.valid?
      @movie.save
      redirect_to movie_url(@movie),  notice: "Movie updated successfully."
    else
      redirect_to movie_url(@movie), alert: "Movie failed to update successfully." 
    end
  end

  def destroy
    @movie = Movie.find( params.fetch(:id))

    @movie.destroy

    redirect_to movies_url,  notice: "Movie deleted successfully."
  end
end
