class Feat < ApplicationRecord
    belongs_to :project
    belongs_to :user
    validates :title, presence: true, length: { in: 5..150 }  
end
