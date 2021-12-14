class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
    end
    create_join_table :projects, :skills do |t|
      t.index :project_id
      t.index :skill_id
    end
    create_join_table :skills, :users do |t|
      t.index :skill_id
      t.index :user_id
    end      
  end
end
