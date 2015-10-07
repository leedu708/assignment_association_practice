class CreatePostTaggings < ActiveRecord::Migration
  def change
    create_table :post_taggings do |t|
      t.integer :post_id
      t.integer :tag_id

      t.index :post_id
      t.index :tag_id

      t.timestamps null: false
    end
  end
end
