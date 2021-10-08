class AllUserRequestsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.find(params[:user_id])
    @all_user_request = AllUserRequest.new
  end

  def create
    @all_user_request = AllUserRequest.new(all_user_request_params)
    if @all_user_request.valid?
      @all_user_request.save
    else
      @user = User.find(params[:user_id])
      render :new
    end
  end

  def show
    
  end

  def destroy
    
  end

  private 

  def all_user_request_params
    params.require(:all_user_request).permit(:text , :is_open_name).merge(request_creater_id: current_user.id , user_id: params[:user_id])
  end
end
