class AllUserRequestsController < ApplicationController
  before_action :check_login
  before_action :check_same_user , only: [:show , :update , :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.find(params[:user_id])
    @all_user_request = AllUserRequest.new
  end

  def create
    @all_user_request = AllUserRequest.new(all_user_request_params)
    @all_user_request.status = 0
    if @all_user_request.valid?
      @user = User.find(params[:user_id])
      if check_no_same_request(@user , @all_user_request)
        @all_user_request.save
      end
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
    @all_user_request = AllUserRequest.find_by(id: params[:id] , user_id: params[:user_id])
    @all_user_request.destroy
    redirect_to user_all_user_request_path(current_user , "all")
  end

  def update
    @all_user_request = AllUserRequest.find_by(id: params[:request_id] , user_id: params[:user_id])
    if params[:controll_id] == "finished"
      @all_user_request.status = 2
    elsif params[:controll_id] == "received"
      @all_user_request.status = 1
    end
    @all_user_request.save
    redirect_to user_all_user_request_path(current_user , "all")
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

  def check_same_user
    if params[:user_id].to_i != current_user.id
      redirect_to user_all_user_requests_path("index")
    end
  end

  def check_no_same_request(users , create_request)
    users.all_user_requests.each do |request|
      if create_request.text == request.text
        if create_request.request_creater_id == request.request_creater_id
          return false
        end
      end
    end
    return true
  end
end
