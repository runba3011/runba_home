class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      # binding.pry
      @group = Group.find(params[:group_id])

      if @message.image.attached?
        @message_image_url = url_for(@message.image)
      else
        @message_image_url = nil
      end 

      if current_user.icon_image.attached?
        @icon_image = current_user.icon_image
        @icon_image = url_for(@icon_image)
      else
        @icon_image = URI("/assets/defaults/user_icon_image.png")
      end
      @message.text = @message.text.gsub(/(\r\n|\r|\n)/, "<br>")
      calc_time
      ActionCable.server.broadcast 'message_channel' , content: @message , user: current_user , group: @group , icon_image_url: @icon_image , message_image_url: @message_image_url , is_destroy: false , nil: false
    else
      ActionCable.server.broadcast 'message_channel' , nil: true
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.user.id == current_user
      @message.text = nil
      @message.update(text: nil)
      @group = Group.find(params[:group_id])
      ActionCable.server.broadcast 'message_channel' , is_destroy: true , destroy_message_id: params[:id] , nil: false
    else
      ActionCable.server.broadcast 'message_channel' , nil: true
    end
    # redirect_to group_path(@group)
  end

  private
  def calc_time

    difference = Time.zone.now - @message.created_at #これで何秒前に投稿されたのかがわかった
    minutes = difference / 60 
    hours = minutes / 60
    days = hours / 24  #これで何日前に投稿されたものかがわかった
    weeks = days / 7
    months = days / 30
    years = days / 365
    if difference < 0
      @message.time_type = "detail_date"
      @message.show_time = "？？？"
    elsif difference == 0
      @message.time_type = "seconds"
      @message.show_time = 0
    elsif minutes < 1
      @message.time_type = "seconds"
      @message.show_time = difference.floor
    elsif hours < 1
      @message.time_type = "minutes"
      @message.show_time = minutes.floor
    elsif days < 1
      @message.time_type = "hours"
      @message.show_time = hours.floor
    elsif weeks < 1
      @message.time_type = "days"
      @message.show_time = days.floor
    elsif months < 1
      @message.time_type = "weeks"
      @message.show_time = weeks.floor
    elsif years < 1 && months <= 2
      @message.time_type = "months"
      @message.show_time = months.floor
    else
      @message.time_type = "detail_date"
      @message.show_time = @message.created_at
    end
  end

  def message_params
    params.require(:message).permit(:text , :image).merge(user_id: current_user.id , group_id: params[:group_id])
  end
end
