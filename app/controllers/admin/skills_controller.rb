module Admin
  class SkillsController < ApplicationController
    before_action :set_skill, only: [:edit, :destroy, :update]

    def index
      @skills = Skill.all
    end

    def new
      @skill = Skill.new
    end

    def create
      @skill = Skill.new(skill_params)
      if @skill.save
        flash[:success] = "La compétence a bien été crée !"
        redirect_to admin_skills_path
      else
        flash[:warning] = "Il y eu un problème lors de la création de la compétence."
        render 'new'
      end
    end

    def edit
    end

    def update
      if @skill.update_attributes(skill_params)
        flash[:success] = "La compétence a bien été édité"
        redirect_to admin_skills_path
      else
        flash[:warning] = "Il y a eu un problème lors de la modification de la compétence."
        render 'edit'
      end
    end

    def destroy
      if @skill.destroy
        flash[:success] = 'La compétence a bien été supprimée.'
        redirect_to admin_skills_path
      else
        flash[:warning] = 'Il y a eu un problème lors de la suppression de la compétence.'
        redirect_to admin_skills_path
      end
    end

    private

    def skill_params
      params.require(:skill).permit(:name)
    end

    def set_skill
      @skill = Skill.find(params[:id])
    end
  end
end