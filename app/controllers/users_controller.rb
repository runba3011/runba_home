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

  def update
    if current_user == @user
      if @user.update(user_params)
      else
        render :edit
        return
      end
    end
    redirect_to user_path(@user)
  end

  private 

  def user_params
    params.require(:user).permit(:nickname , :background_image , :icon_image, :explain, :account_name)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def check_same_user
    if @user != current_user
      redirect_to root_path
    end
  end
end
