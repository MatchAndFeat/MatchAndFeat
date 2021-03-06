class Feat < ApplicationRecord
  after_create :create_feat_email_send
  before_destroy :purge_all_attachments

  belongs_to :project
  belongs_to :user
  has_many_attached :attachments
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  
  validates :title, presence: true, length: { in: 5..150 }
  validates :description, presence: true, length: { in: 5..3000 }
  validates :attachments, 
    size: { less_than: 20.megabytes },
    content_type: ['image/png', 'image/jpg', 'image/jpeg',
                    'audio/x-wav', 'audio/mpeg',
                    'video/mp4',
                    'text/plain']
    
  private

  def create_feat_email_send
    UserMailer.new_feat_email(self).deliver_now
  end
  
end
