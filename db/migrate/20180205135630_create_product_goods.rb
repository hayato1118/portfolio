class CreateProductGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :product_goods do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
