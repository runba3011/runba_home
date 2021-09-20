class GroupUserRelationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_ser_relation_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
