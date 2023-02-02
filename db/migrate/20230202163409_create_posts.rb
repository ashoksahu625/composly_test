class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :author_type
      t.integer :user_id
      t.timestamps
    end
  end
end
