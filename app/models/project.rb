class Project < ApplicationRecord
  after_create :create_project_email_send
  before_destroy :purge_all_attachments

  has_many :feats, dependent: :destroy
  has_many_attached :attachements, dependent: :destroy
  has_one_attached :picture
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
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
                   'video/mp4',
                   'text/plain']

  private

  def create_project_email_send
    UserMailer.create_project_email(self).deliver_now
  end

  def self.sorted_by(type)
    case type
    when "popularity"
      puts "popularity"
      self.all.sort_by { |project| project.likes.count }.reverse
    when "last_created"
      puts "last_created"
      self.all.order(created_at: :desc)
    when "interest"
      Project.all.each
      current_user.skills
    else
      self.all
    end
  end
end
