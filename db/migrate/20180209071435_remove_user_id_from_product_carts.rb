class RemoveUserIdFromProductCarts < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_carts, :user_id, :integer
  end
end
