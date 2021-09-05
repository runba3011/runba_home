class StickmanWarCommentsController < ApplicationController

  def create
    @comment = StickmanWarComment.new(stickman_war_comment_params)
    redirect_to stickman_war_stickman_war_detail_path(params[:stickman_war_id] , params[:stickman_war_detail_id])
  end

  private

  def stickman_war_comment_params
    params.require(:stickman_war_comment).permit(:text).merge(user_id: current_user.id , stage_id: params[:stickman_war_detail_id] , stage_type: params[:stickman_war_id])
  end
end
