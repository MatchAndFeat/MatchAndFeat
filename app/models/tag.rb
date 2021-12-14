class Tag < ApplicationRecord
  has_many :join_table_tags_projects
  has_many :projects, through: :join_table_tags_projects
end
