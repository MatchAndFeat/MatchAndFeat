class UserMailer < ApplicationMailer
  default from: 'matchandfeathp@gmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://matchandfeathp.herokuapp.com/login' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def create_project_email(project)
    @project = project
    @url = 'https://matchandfeathp.herokuapp.com/login'
    mail(to: @project.user.email, subject: 'Création du projet terminer')
  end
end
