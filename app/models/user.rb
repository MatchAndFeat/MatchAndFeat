class User < ApplicationRecord
  after_create :welcome_send

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true
  validates :email,
      presence: true,
      uniqueness: true,
      format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
      
  has_many :projects
  has_many :feats

  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
end
