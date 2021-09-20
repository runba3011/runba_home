class StickmanWarCommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "sstickman_war_comment_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
