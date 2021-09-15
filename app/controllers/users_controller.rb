class UsersController < ApplicationController
  before_action :get_user , only: [:show , :edit]
  before_action :check_same_user , only: :edit
  
  def index
    flash[:notice] = nil
  end

  def show

  end

  def edit 

  end

  private 

  def get_user
    @user = User.find(params[:id])
  end

  def check_same_user
    if @user != current_user
      redirect_to root_path
    end
  end
end
