class RequestsController < ApplicationController
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
end
