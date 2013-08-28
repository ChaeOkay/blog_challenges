class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags do |t|
      t.references :tag
      t.references :post
    end
  end
end
