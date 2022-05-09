class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
    
      t.timestamps
    end
    add_index :posts, :create_user_id
  end
end
