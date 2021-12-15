class AddSocialsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :social_link, :string
  end
end
