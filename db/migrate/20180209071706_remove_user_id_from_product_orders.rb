class RemoveUserIdFromProductOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_orders, :user_id, :integer
  end
end
