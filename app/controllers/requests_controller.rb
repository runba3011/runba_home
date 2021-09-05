class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    
  end

  private

  def request_params
    params.require(:request).permit(:text).merge(user_id: current_user.id , )
  end
end
