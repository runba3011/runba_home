class StickmanWarCommentsController < ApplicationController

  def create
    @comment = StickmanWarComment.new(stickman_war_comment_params)
    if @comment.valid?
      @comment.save
      if current_user.icon_image.attached?
        @user_icon_url = url_for(current_user.icon_image)
      else
        @user_icon_url = URI("/assets/defaults/user_icon_image.png")
      end
      ActionCable.server.broadcast 'stickman_war_comment_channel' , comment: @comment, user_icon_url: @user_icon_url , user: current_user , is_destroy: false
      # binding.pry
      return
      # 非同期通信化したので必要ないと思われるが、念のため残しておく↓
      # redirect_to stickman_war_stickman_war_detail_path(params[:stickman_war_id] , params[:stickman_war_detail_id])
    else
      @comments = StickmanWarComment.where(stage_type: params[:stickman_war_id] , stage_id: params[:stickman_war_detail_id])
      @create_path = stickman_war_stickman_war_detail_stickman_war_comments_path(params[:stickman_war_id] , params[:stickman_war_detail_id]) 
      @show_page_path = "stickman_war_detail/#{params[:stickman_war_id]}/stage#{params[:stickman_war_detail_id]}"

      @stickman_war_stage_type = params[:stickman_war_id]
      @stickman_war_stage_number = params[:stickman_war_detail_id]
      render "stickman_war_detail/show"
    end
  end

  def destroy
    @comment = StickmanWarComment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
    end

    @stickman_war_stage_type = params[:stickman_war_id]
    @stickman_war_stage_number = params[:stickman_war_detail_id]
    ActionCable.server.broadcast 'stickman_war_comment_channel' , is_destroy: true ,destroy_id: params[:id]
    # redirect_to stickman_war_stickman_war_detail_path(params[:stickman_war_id] , params[:stickman_war_detail_id])
  end

  private

  def stickman_war_comment_params
    params.require(:stickman_war_comment).permit(:text).merge(user_id: current_user.id , stage_id: params[:stickman_war_detail_id] , stage_type: params[:stickman_war_id])
  end
end
