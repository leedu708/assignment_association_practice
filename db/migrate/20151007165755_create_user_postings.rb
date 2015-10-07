class CreateUserPostings < ActiveRecord::Migration
  def change
    create_table :user_postings do |t|
      t.integer :user_id
      t.integer :post_id

      t.index :user_id
      t.index :post_id

      t.timestamps null: false
    end
  end
end
