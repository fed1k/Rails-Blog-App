class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :users, null: false, foreign_key: true
      t.string :title
      t.string :text
      t.references :comments, null: false, foreign_key: true
      t.references :likes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
