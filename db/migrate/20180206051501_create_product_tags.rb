class CreateProductTags < ActiveRecord::Migration[5.1]
  def change
    create_table :product_tags do |t|
      t.integer :Product_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
