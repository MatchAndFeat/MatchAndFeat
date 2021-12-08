class Project < ApplicationRecord
    has_many :feats
    has_many_attached :attachements
    has_one_attached :picture
    belongs_to :user 
    validates :title, presence: true, length: { in: 5..150 }
    validates :description, presence: true, length: { in: 5..3000 }
end
