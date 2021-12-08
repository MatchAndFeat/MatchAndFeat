class UserMailer < ApplicationMailer
  default from: 'matchandfeathp@gmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://matchandfeathp.herokuapp.com/login' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
end
