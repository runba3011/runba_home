class StickmanWarDetailController < ApplicationController
  def show
    render "stickman_war_detail/#{params[:stickman_war_id]}/stage#{params[:id]}"
    @comment = StickmanWarComment.new
  end
end
