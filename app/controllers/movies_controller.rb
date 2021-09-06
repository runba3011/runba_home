class MoviesController < ApplicationController
  def index
    # おすすめ動画は、おすすめ部分と動画一覧の両方で見えるようにする
    @reccomend_movies = Movie.where(reccomend: true)
    @movies = Movie.all
    
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
