class CreateFeats < ActiveRecord::Migration[5.2]
  def change
    create_table :feats do |t|
      t.string :title
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      
      t.timestamps
    end
  end
end
