class CreateProductCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :product_carts do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
