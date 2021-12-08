class Project < ApplicationRecord
    has_many :feats
    belongs_to :user 
end
