class User < ApplicationRecord
  after_create :welcome_send
  after_create :username_attribution

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :user_name, presence: true, uniqueness: true, on: :update
  validates :social_link, 
  format: { with: /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/i },
  on: :update

  has_many :projects, dependent: :destroy
  has_many :feats, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_and_belongs_to_many :skills
  has_one_attached :avatar
  
  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  def username_attribution
    self.update(user_name: "Pseudo#{self.id }")
  end

end
