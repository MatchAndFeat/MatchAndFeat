module Admin
  class ProjectsController < ApplicationController
    before_action :set_project, except: [:index]

    def index
      @projects = Project.all.order(id: :desc)
    end

    def show
    end
    
    def edit
    end

    def update
      if @project.update_attributes(project_params)
        flash[:success] = "Le projet a bien été édité"
        redirect_to edit_admin_project_path(@project)
      else
        flash[:warning] = "Il y a eu un problème lors de la modification du projet."
        render 'edit'
      end
    end
    
    def destroy
      if @project.destroy
        flash[:success] = 'Le projet a bien été supprimé.'
        redirect_to admin_projects_path
      else
        flash[:warning] = 'Il y a eu un problème lors de la suppression du projet.'
        redirect_to @project
      end
    end

    private

    def project_params
      params.require(:project).permit(:title, :description, :picture, attachements: [], skill_ids: [])
    end

    def set_project
      @project = Project.find(params[:id])
    end
  end
end