class AddCreateUserIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :create_user_id, :integer
    add_index :posts, :create_user_id
  end
end
