class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order(id: :desc)
  end

  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Votre projet a bien été crée !"
      redirect_to @project
    else
      flash[:warning] = "Il y eu un problème lors de la création de votre Projet."
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
      if @project.update_attributes(project_params)
        flash[:success] = "Votre Projet a bien été édité"
        redirect_to @project
      else
        flash[:error] = "Il y a eu un problème lors de la modification de votre Projet."
        render 'edit'
      end
  end
  
  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:success] = 'Votre Projet a bien été supprimé.'
      redirect_to root_path
    else
      flash[:warning] = 'Il y a eu un problème lors de la suppression de votre Projet.'
      redirect_to @project
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
