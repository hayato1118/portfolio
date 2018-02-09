class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.integer :Product_id
      t.integer :category_id

      t.timestamps
    end
  end
end
