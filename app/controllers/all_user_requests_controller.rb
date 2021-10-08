class AllUserRequestsController < ApplicationController
  before_action :check_login

  def index
    if params[:user_id] != "index"
      @user = User.find(params[:user_id])
    else
      @users = User.all
    end
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
    @user = User.find(params[:user_id])
    # @request = AllUserRequest.find_by(id: params[:id] , user_id: params[:user_id])
  end

  def destroy
    
  end

  private 

  def all_user_request_params
    params.require(:all_user_request).permit(:text , :is_open_name).merge(request_creater_id: current_user.id , user_id: params[:user_id])
  end

  def check_login
    if !user_signed_in?
      redirect_to new_request_path
    end
  end
end
