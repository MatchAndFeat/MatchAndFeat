class ProjectsController < ApplicationController
  before_action :require_login, except: [:index]
  before_action :set_project, except: [:index, :new, :create]
  before_action :ownership_verification, only: [:edit, :update, :destroy]

  def index
    @sort_types_list = { last_created: "derniers crées",
                         popularity: "popularité",
                         common_skills: "compétences communes", 
                         liked: "projets aimés", 
                         feated: "tes feats" }
    @projects = projects_sorted_by(params[:sort_type])
    if params[:sort_type].nil?
      @sort_type = @sort_types_list[:last_created]
    else
      @sort_type = @sort_types_list[params[:sort_type].to_sym]
    end
  end

  def show
    @feat = Feat.new
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      flash[:success] = "Votre projet a bien été crée !"
      redirect_to @project
    else
      flash[:warning] = "Il y eu un problème lors de la création de votre Projet."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = "Votre Projet a bien été édité"
      redirect_to @project
    else
      flash[:error] = "Il y a eu un problème lors de la modification de votre Projet."
      render 'edit'
    end
  end
  
  def destroy
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
    params.require(:project).permit(:title, :description, :picture, attachements: [], skill_ids: [])
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def ownership_verification
    unless @project.user == current_user
      flash[:danger] = "Vous n'avez pas la permission d'accéder à cette page"
      redirect_to root_path
    end
  end

  def projects_sorted_by(type)
    case type
    when "popularity"
      Project.all.sort_by { |project| project.likes.count }.reverse
    when "last_created"
      Project.all.order(created_at: :desc)
    when "common_skills"
      interest = []
      current_user.skills.each do |user_skill|
        Project.all.each do |project|
          interest << project if project.skills.include?(user_skill)
        end
      end
      interest.uniq
    when "liked"
      Project.all.select { |project| project.likers.include?(current_user) }
    when "feated"
      Project.all.select { |project| project.featers.include?(current_user) }
    else
      Project.all.order(created_at: :desc)
    end
  end
end
