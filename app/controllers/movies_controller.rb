class MoviesController < ApplicationController
  def index
    # おすすめ動画は、おすすめ部分と動画一覧の両方で見えるようにする
    @reccomend_movies = Movie.where(reccomend: true)
    @movies = Movie.all
    @reccomend_movies.order("id DESC")
    @movies.order("id DESC")
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_comment = MovieComment.new
  end
end
