class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      redirect_to group_path
    else
      @group = Group.find(params[:group_id])
      @is_show = true
      render "groups/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id , group_id: params[:group_id])
  end
end
