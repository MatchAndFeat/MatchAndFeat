module Admin
  class UsersController < AdminController
    before_action :set_user, except: [:index, :new, :create]

    def index
      @users = User.order(:id)
    end

    def new
      @user = User.new
    end

    def show
    end

    def edit
    end

    def update
      if @user.update(user_params)
        flash[:success] = "L'utilisateur a bien été mis à jour."
        redirect_to admin_users_path
      else
        flash[:warning] = "Il y a eu un problème lors de la mise à jour de l'utilisateur"
        render 'edit'
      end
    end
    
    def destroy
      if @user.destroy
        flash[:success] = "L'utilisateur a bien été supprimé."
        redirect_to admin_users_path
      else
        flash[:warning] = "Il y a eu un problème lors de la suppression de l'utilisateur"
        redirect_to admin_users_path
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :user_name, :social_link, :status )
    end

  end
end
