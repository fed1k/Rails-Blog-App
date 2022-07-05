class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :bio
      t.string :name
      t.integer :postscounter
      t.string :photo

      t.timestamps
    end
  end
end
