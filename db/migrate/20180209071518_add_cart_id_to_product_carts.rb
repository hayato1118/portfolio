class AddCartIdToProductCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :product_carts, :cart_id, :integer
  end
end
