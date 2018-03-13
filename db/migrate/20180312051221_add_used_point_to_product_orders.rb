class AddUsedPointToProductOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :product_orders, :used_point, :integer, :default => 0
  end
end
