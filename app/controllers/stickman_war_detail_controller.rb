class StickmanWarDetailController < ApplicationController
  def show
    @comment = StickmanWarComment.new
    render "stickman_war_detail/#{params[:stickman_war_id]}/stage#{params[:id]}"
  end
end
