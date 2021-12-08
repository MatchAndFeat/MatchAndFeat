class Feat < ApplicationRecord
    belongs_to :project
    belongs_to :user
    has_many_attached :attachements
    validates :title, presence: true, length: { in: 5..150 }  
end
