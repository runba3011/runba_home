class AllUserRequestsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.find(params[:user_id])
    @all_user_request = AllUserRequest.new
  end

  def create
    @user = User.new(all_user_request_params)
    binding.pry
  end

  def show
    
  end

  def destroy
    
  end

  private 

  def all_user_request_params
    params.require(:all_user_request).permit(:text , :is_open_name).merge(user_id: current_user)
  end
end
