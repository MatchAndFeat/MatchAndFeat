module Admin
  class AdminController < ::ApplicationController
    before_action :is_admin?

    def is_admin?
      unless user_signed_in? && current_user.status == "admin"
        flash[:danger] = "Vous n'avez pas la permission d'accéder à cette page"
        redirect_to root_path
      end
    end
  end
end