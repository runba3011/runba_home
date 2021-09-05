class StickmanWarDetailController < ApplicationController
  def show
    @comments = StickmanWarComment.where(stage_type: params[:stickman_war_id] , stage_id: params[:id])
    @comment = StickmanWarComment.new
    @create_path = stickman_war_stickman_war_detail_stickman_war_comments_path(params[:stickman_war_id] , params[:id]) 
    @show_page_path = "stickman_war_detail/#{params[:stickman_war_id]}/stage#{params[:id]}"
  end
end
