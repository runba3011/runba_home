class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      # binding.pry
      @group = Group.find(params[:group_id])
      if current_user.icon_image.attached?
        @icon_image = current_user.icon_image
      else
        @icon_image = nil
      end
      ActionCable.server.broadcast 'message_channel' , content: @message , user: current_user , group: @group , icon_image: @icon_image
    else
      redirect_to group_path(@message.group)
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
    params.require(:message).permit(:text , :image).merge(user_id: current_user.id , group_id: params[:group_id])
  end
end
