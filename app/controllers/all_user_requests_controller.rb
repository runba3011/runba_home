require "date"
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
    # binding.pry
    if params[:id] == "status_up"
      @requests = @user.all_user_requests.order("status DESC")
      @sort_type = "進んでいる順"

    elsif params[:id] == "status_down"
      @requests = @user.all_user_requests.order("status ASC")
      @sort_type = "進んでいない順"

    elsif params[:id] == "created_at_up"
      @requests = @user.all_user_requests.order("created_at DESC")
      @sort_type = "新しい順"

    elsif params[:id] == "created_at_down"
      @requests = @user.all_user_requests.order("created_at ASC")
      @sort_type = "古い順"

    else
      @requests = @user.all_user_requests
    end

    @requests.each do |request|
      # time_difference
      difference = Time.zone.now - request.created_at #この値が「秒」となる
      minutes = difference / 60 
      hours = minutes / 60
      days = hours / 24  #これで何日前に投稿されたものかがわかった
      weeks = days / 7
      months = days / 30
      years = days / 365
      if minutes < 1
        request.time_difference = difference.floor.to_s+"秒前"
      elsif hours < 1
        request.time_difference = minutes.floor.to_s+"分前"
      elsif days < 1
        request.time_difference = hours.floor.to_s+"時間前"
      elsif weeks < 1
        request.time_difference = days.floor.to_s+"日前"
      elsif months < 1
        request.time_difference = weeks.floor.to_s+"週間前"
      elsif years < 1 && months <= 2
        request.time_difference = months.floor.to_s+"ヶ月前"
      else
        request.time_difference = nil
      end
    end

    @request
  end

  def destroy
    @all_user_request = AllUserRequest.find_by(id: params[:id] , user_id: params[:user_id])
    @all_user_request.destroy
    # render :show
    ActionCable.server.broadcast 'all_user_request_channel' , request: @all_user_request , control_type: "destroy"
  end

  def update
    @all_user_request = AllUserRequest.find_by(id: params[:request_id] , user_id: params[:user_id])
    if params[:controll_id] == "finished"
      @all_user_request.status = 2
    elsif params[:controll_id] == "received"
      @all_user_request.status = 1
    elsif params[:controll_id] == "untreated"
      @all_user_request.status = 0
    end
    @all_user_request.save
    ActionCable.server.broadcast 'all_user_request_channel' , request: @all_user_request , control_type: "update"
  end

  def search
    if params[:keyword] != ""
      return_request = AllUserRequest.where("text LIKE?" , "%#{params[:keyword]}%").where(user_id: params[:user_id])
      @searched_requests = return_request
      # binding.pry
    end
    show
    render :show
  end

  def user_search
    if params[:keyword] != ""
      return_users = User.where("nickname LIKE?", "%#{params[:keyword]}%")
      return_users_by_account_name = User.where("account_name LIKE?" , "%#{params[:keyword]}%")
      @searched_users = []
      return_users.each do |user|
        @searched_users << user
      end

      # 統一せ雨を持たせるためにここでも既に追加されていないことを確認する
      return_users.each do |user|
        if !check_added_user(user , @searched_users)
          @searched_users << user
        end
      end

      # ユーザー名の部分で既に追加されていないことを確認してから配列に追加する
      return_users_by_account_name.each do |user|
        if !check_added_user(user , @searched_users)
          @searched_users << user
        end
      end
    end
    index
    render :index
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

  def check_added_user(add , all)
    all.each do |added|
      if added == add
        return true
      end
    end
    return false
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
