class AllUserRequestsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    
  end

  def create
    
  end

  def show
    
  end

  def destroy
    
  end

  private 

  def all_user_request_params
    @all_user_request = AllUserRequsts.find(params[:id])
  end
end
