class MoviesController < ApplicationController
  def index
    # おすすめ動画は、おすすめ部分と動画一覧の両方で見えるようにする
    @search_movies = nil;
    @reccomend_movies = Movie.where(reccomend: true)
    @movies = Movie.all
    @reccomend_movies =  @reccomend_movies.sort_by{|movie|movie.id}.reverse
    @movies =  @movies.sort_by{|movie|movie.id}.reverse
  end

  def show
    @movie = Movie.find(params[:id])
    # binding.pry
    if @movie.id != params[:id].to_i
      @movie = Movie.find(Movie.all.length - params[:id].to_i)
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
