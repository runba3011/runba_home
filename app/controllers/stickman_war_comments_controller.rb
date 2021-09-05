class StickmanWarCommentsController < ApplicationController

  def create
    @comment = StickmanWarComment.new(stickman_war_comment_params)
    binding.pry
    if @comment.valid?
      @comment.save
      redirect_to stickman_war_stickman_war_detail_path(params[:stickman_war_id] , params[:stickman_war_detail_id])
    else
      binding.pry
      @comments = StickmanWarComment.where(stage_type: params[:stickman_war_id] , stage_id: params[:stickman_war_detail_id])
      @create_path = stickman_war_stickman_war_detail_stickman_war_comments_path(params[:stickman_war_id] , params[:stickman_war_detail_id]) 
      render "stickman_war_detail/#{params[:stickman_war_id]}/stage#{params[:stickman_war_detail_id]}"
    end
  end

  private

  def stickman_war_comment_params
    params.require(:stickman_war_comment).permit(:text).merge(user_id: current_user.id , stage_id: params[:stickman_war_detail_id] , stage_type: params[:stickman_war_id])
  end
end
