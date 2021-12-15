class Home < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message

 
  def headers
    {
      :subject => "Email de contact",
      :to => "adminadmin@yopmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end