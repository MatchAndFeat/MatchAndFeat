class FeatsController < ApplicationController
  def index
    @feats = Project.find(params[:project_id]).feats.order(id: :desc)
  end

  def show
    @feat = Feat.find(params[:id])
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
      redirect_to @feat
    else
      flash[:error] = "Il y eu un problème lors de la création de votre Feat."
      render 'new'
    end
  end

  def edit
    @feat = Feat.find(params[:id])
  end

  def update
    @feat = Feat.find(params[:id])
      if @feat.update_attributes(feat_params)
        flash[:success] = "Votre Feat a bien été édité"
        redirect_to @feat
      else
        flash[:warning] = "Il y a eu un problème lors de la modification de votre Feat."
        render 'edit'
      end
  end
  
  def destroy
    @feat = Feat.find(params[:id])
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
    params.require(:feat).permit(:title, :attachement)
  end
end