class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      redirect_to group_path(@message.group)
    else
      @group = Group.find(params[:group_id])
      @is_show = true
      render "groups/show"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.text = nil
    @message.update(text: nil)
    @group = Group.find(params[:group_id])
    redirect_to group_path(@group)
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id , group_id: params[:group_id])
  end
end
