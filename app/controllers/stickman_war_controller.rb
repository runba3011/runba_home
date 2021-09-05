class StickmanWarController < ApplicationController
  def show
    render "stickman_war/#{params[:id]}"
  end
end
