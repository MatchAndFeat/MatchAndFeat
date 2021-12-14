class User < ApplicationRecord
  after_create :welcome_send
  after_create :username_attribution
  after_commit :add_default_avatar, on: %i[create update]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,
      presence: true,
      uniqueness: true,
      format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
      
  has_many :projects
  has_many :feats
  has_many :likes
  has_and_belongs_to_many :skills
  has_one_attached :avatar
  
  def avatar_thumbnail
    if avatar.attached?
    avatar  
    else  
      "/micro.png"
    end
  end

  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  def username_attribution
    self.update(user_name: "Pseudo#{self.id }")
  end

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'micro.png' 
          )
        ), 
        filename: 'micro.png',
        content_type: 'image/png'
      )
    end
  end
end
