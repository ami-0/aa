class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :height
      t.string :weight
      t.string :bone
      t.string :brand
      t.integer :price
      t.text :about

      t.timestamps
    end
  end
end
