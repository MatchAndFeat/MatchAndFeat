class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    unless logged_in?
      flash[:error] = "Merci de vous connecter pour accéder à cette page."
      redirect_to new_user_session_path
    end
  end
end
