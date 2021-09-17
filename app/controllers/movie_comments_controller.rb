class MovieCommentsController < ApplicationController
  def create
    @movie_comment = MovieComment.new(movie_comment_params)
    if @movie_comment.valid?
      @movie_comment.save
      ActionCable.server.broadcast 'movie_comment_channel' , comment: @movie_comment , user: current_user
    else
      @comments = MovieComment.where(id: params[:movie_id])
      @movie = Movie.find(params[:movie_id])
      render "movies/show"
    end
  end

  def update
    
  end

  def destroy
    
  end

  def movie_comment_params
    params.require(:movie_comment).permit(:text).merge(user_id: current_user.id , movie_id: params[:movie_id])
  end

end
