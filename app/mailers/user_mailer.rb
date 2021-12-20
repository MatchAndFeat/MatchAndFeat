class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  default from: ENV['EMAIL_FROM']
 
  def welcome_email(user)
    @user = user
    @url  = url_for(@user)
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def create_project_email(project)
    @project = project
    @url = url_for(@project)
    mail(to: @project.user.email, subject: "Création du projet '#{@project.title}'")
  end

  def new_feat_email(feat)
    @feat = feat
    @url = url_for(@feat.project)
    mail(to: @feat.user.email, subject: "Nouvelle collaboration sur le projet '#{@feat.project.title}'")
  end
end
