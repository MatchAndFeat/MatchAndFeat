class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :user_name])
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "Merci de vous connecter pour accéder à cette page."
      redirect_to new_user_session_path
    end
  end
end
