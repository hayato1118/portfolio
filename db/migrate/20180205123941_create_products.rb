class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.integer :price
      t.string :image_id
      t.string :title
      t.string :category
      t.string :url
      t.string :product_tag
      t.text :product_detail

      t.timestamps
    end
  end
end
