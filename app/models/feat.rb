class Feat < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many_attached :attachements
  
  validates :title, presence: true, length: { in: 5..150 }  
  validates :attachements, 
  size: { less_than: 20.megabytes },
  content_type: ['image/png', 'image/jpg', 'image/jpeg',
                  'audio/x-wav', 'audio/mpeg',
                  'video/mpeg',
                  'text/plain']
end
