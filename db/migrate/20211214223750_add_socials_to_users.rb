class AddSocialsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :social_link_1, :string
    add_column :users, :social_link_2, :string
  end
end
