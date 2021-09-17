class MovieCommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "movie_comment_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
