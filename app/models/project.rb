class Project < ApplicationRecord
    after_create :create_project_email_send
    has_many :feats
    has_many_attached :attachements
    has_one_attached :picture
    belongs_to :user 
    validates :title, presence: true, length: { in: 5..150 }
    validates :description, presence: true, length: { in: 5..3000 }
    
    
    
    private

    def create_project_email_send
        UserMailer.create_project_email(self).deliver_now
      end
end
