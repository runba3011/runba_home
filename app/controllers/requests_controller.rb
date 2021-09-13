class RequestsController < ApplicationController
  before_action :check_params , only: :show
  before_action :creater_auth , only: :show
  before_action :set_is_group_true

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.valid?
      @request.save
    else
      render :new
    end
  end

  def show
    @requests = Request.all.order("created_at DESC")
  end

  private

  def check_params
    if params[:id] != "secret" 
      redirect_to new_request_path
    end
  end

  def request_params
    params.require(:request).permit(:text).merge(user_id: current_user.id)
  end

  def creater_auth
    authenticate_or_request_with_http_basic do |username , password|
      username == ENV["RUNBA_HOME_USER"] && password == ENV["RUNBA_HOME_PASSWORD"]
    end
  end

  def set_is_group_true
    @is_group = true
  end
end
