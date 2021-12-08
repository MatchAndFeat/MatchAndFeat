class User < ApplicationRecord
  after_create :welcome_send

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true



  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
end
