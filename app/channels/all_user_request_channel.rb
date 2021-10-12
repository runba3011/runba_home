class AllUserRequestChannel < ApplicationCable::Channel
  def subscribed
    stream_from "all_user_request_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
