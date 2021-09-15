class FollowersController < ApplicationController
  before_action :check_logined

  def create
    @follow = Follower.new
    @follow.user = current_user 
    @follow.following = User.find(params[:user_id])
    if @follow.valid?
      @confirm_follow = Follower.find_by(user_id: current_user.id , following_id: params[:user_id])
      if @confirm_follow == nil
        @follow.save
      end
    end
    redirect_to user_path(params[:user_id])
  end

  def destroy
    
  end

  private

  def check_logined
    if user_signed_in?
      redirect_to user_path(params[:user_id])
    end
  end
end
