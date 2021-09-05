class StickmanWarController < ApplicationController
  def show
    binding.pry
    render "stickman_war/#{params[:id]}"
  end
end
