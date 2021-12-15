class AddDescriptionToFeats < ActiveRecord::Migration[5.2]
  def change
    add_column :feats, :description, :text
  end
end
