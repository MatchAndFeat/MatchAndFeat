class ApplicationController < ActionController::Base

  def require_login
    unless user_signed_in?
      flash[:error] = "Merci de vous connecter pour accéder à cette page."
      redirect_to new_user_session_path
    end
  end
end
