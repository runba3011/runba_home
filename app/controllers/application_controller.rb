class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters , if: :devise_controller?
  before_action :find_user , if: :user_signed_in?

  private 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up , keys: [:nickname , :explain , :account_name])
  end

  def find_user
    @user = User.find(current_user.id)
  end
end
