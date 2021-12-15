class FeatsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_feat, except: [:index, :new, :create]
  before_action :ownership_verification, only: [:edit, :update, :destroy]

  def index
    @feats = Project.find(params[:project_id]).feats.order(id: :desc)
  end

  def show
  end

  def new
    @feat = Feat.new
  end

  def create
    @feat = Feat.new(feat_params)
    @feat.user = current_user
    @feat.project = Project.find(params[:project_id])

    if @feat.save
      flash[:success] = "Votre Feat a bien été publié !"
      redirect_to project_path(params[:project_id])
    else
      flash[:warning] = "Il y eu un problème lors de la création de votre Feat."
      redirect_to project_path(params[:project_id])
    end
  end

  def edit
  end

  def update
      if @feat.update_attributes(feat_params)
        flash[:success] = "Votre Feat a bien été édité"
        redirect_to @feat.project
      else
        flash[:warning] = "Il y a eu un problème lors de la modification de votre Feat."
        render 'edit'
      end
  end

  def destroy
    if @feat.destroy
      flash[:success] = 'Votre Feat a bien été supprimé.'
      redirect_to projects_path(params[:project_id])
    else
      flash[:warning] = 'Il y a eu un problème lors de la suppression de votre Feat.'
      redirect_to @feat
    end
  end

  private

  def feat_params
    params.require(:feat).permit(:title, :description, attachements: [])
  end

  def set_feat
    @feat = Feat.find(params[:id])
  end

  def ownership_verification
    unless @feat.user == current_user
      flash[:danger] = "Vous n'avez pas la permission d'accéder à cette page"
      redirect_to root_path
    end
  end
end
