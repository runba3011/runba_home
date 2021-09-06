class RequestsController < ApplicationController
  before_action :only_redirect_to_users_path , unless: :user_signed_in? , except: :show
  before_action :creater_auth , only: :show

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

  def request_params
    params.require(:request).permit(:text).merge(user_id: current_user.id)
  end

  def only_redirect_to_users_path
    redirect_to users_path
  end

  def creater_auth
    authenticate_or_request_with_http_basic do |username , password|
      username == ENV["RUNBA_HOME_USER"] && password == ENV["RUNBA_HOME_PASSWORD"]
    end
  end
end
