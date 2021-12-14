class Project < ApplicationRecord
  after_create :create_project_email_send

  has_many :feats
  has_many_attached :attachements
  has_one_attached :picture
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :likers, through: :likes, source: :user
  has_and_belongs_to_many :skills
 

  validates :title, presence: true, length: { in: 5..150 }
  validates :description, presence: true, length: { in: 5..3000 }
  validates :picture, 
    content_type: ['image/png', 'image/jpg', 'image/jpeg'],
    size: { less_than: 3.megabytes }
  validates :attachements, 
    size: { less_than: 20.megabytes },
    content_type: ['image/png', 'image/jpg', 'image/jpeg',
                   'audio/x-wav', 'audio/mpeg',
                   'video/mpeg',
                   'text/plain']

  private

  def create_project_email_send
    UserMailer.create_project_email(self).deliver_now
  end

end
