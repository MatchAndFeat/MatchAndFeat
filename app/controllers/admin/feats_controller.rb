module Admin
  class FeatsController < ApplicationController
    before_action :set_feat, except: [:index]

    def index
      @project = Project.find(params[:project_id])
      @feats = @project.feats.order(id: :desc)
    end

    def edit
    end

    def update
      if @feat.update_attributes(feat_params)
        flash[:success] = "Le Feat a bien été édité"
        redirect_to admin_project_feats_path(@feat.project)
      else
        flash[:warning] = "Il y a eu un problème lors de la modification du Feat."
        render 'edit'
      end
    end

    def destroy
      if @feat.destroy
        flash[:success] = 'Le Feat a bien été supprimé.'
        redirect_to edit_admin_project_path(params[:project_id])
      else
        flash[:warning] = 'Il y a eu un problème lors de la suppression du Feat.'
        redirect_to @feat
      end
    end

    private

    def feat_params
      params.require(:feat).permit(:title, :description, attachments: [])
    end

    def set_feat
      @feat = Feat.find(params[:id])
    end
  end
end
