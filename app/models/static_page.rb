class StaticPage < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message

 
  def headers
    {
      :subject => "Message d'un utilisateur Match&Feat",
      :to => "matchandfeathp@gmail.com",
      :from => "matchandfeathp@gmail.com"
    }
  end
end