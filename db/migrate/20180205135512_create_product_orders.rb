class CreateProductOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :product_orders do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :total_price
      t.integer :price
      t.integer :user_id
      t.string :title
      t.integer :quantity
      t.integer :used_point, default: 0
      t.timestamps
    end
  end
end




