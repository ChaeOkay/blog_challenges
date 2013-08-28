class CreatePosts < ActiveRecord::Migration

  def change
    create_table :posts do |t|
      t.string :title
      t.string :body

      t.timestamps
    end

    add_index :posts, :title, :unique => true
    add_index :posts, :body, :unique => true
  end

end
