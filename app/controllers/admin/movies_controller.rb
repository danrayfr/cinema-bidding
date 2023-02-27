class Admin::MoviesController < Admin::AdminController
  before_action :set_movie, only: %i(show, new, edit)

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit; end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format| 
      if @movie.save
        format.html { redirect_to admin_movies_url, notice: 'Movie was successfully created.'}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update 
    @movie = Movie.find(params[:id])
    respond_to do |format| 
      if @movie.update(movie_params)
        format.html { redirect_to admin_movie_url(@movie), notice: 'Movie was successfully updated.'}
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @movie = Movie.find(params[:id])

    respond_to do |format| 
      if @movie.destroy
        format.html { redirect_to admin_movies_url, notice: "Movie deleted successfully!"}
      end
    end
  end

  private 

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title)
  end

end
