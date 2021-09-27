class MoviesController < ApplicationController
  def index
    # おすすめ動画は、おすすめ部分と動画一覧の両方で見えるようにする
    @search_movies = nil;
    @reccomend_movies = Movie.where(reccomend: true)
    @movies = Movie.all
    @reccomend_movies.order("id DESC")
    @movies.order("id DESC")
  end

  def show
    @movie = Movie.find(params[:id])
    # binding.pry
    if @movie.id != params[:id].to_i
      @movie = Movie.find(Movie.all.length-1 - params[:id].to_i)
    end
    @movie_comment = MovieComment.new
    # binding.pry
  end
  
  def search
    index
    @search_movies = Movie.search(params[:keyword])
    render :index
  end
end
