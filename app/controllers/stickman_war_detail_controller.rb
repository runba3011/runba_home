class StickmanWarDetailController < ApplicationController
  def show
    @comments = StickmanWarComment.where(stage_type: params[:stickman_war_id] , stage_id: params[:id])
    @comment = StickmanWarComment.new
    render "stickman_war_detail/#{params[:stickman_war_id]}/stage#{params[:id]}"
  end
end
