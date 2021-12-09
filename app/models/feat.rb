class Feat < ApplicationRecord
    after_create :create_feat_email_send
    belongs_to :project
    belongs_to :user
    has_many_attached :attachements
    validates :title, presence: true, length: { in: 5..150 }
    
    private

    def create_feat_email_send
        UserMailer.new_feat_email(self).deliver_now
    end
end
