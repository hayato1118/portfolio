class AddGetPointToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :get_point, :integer, :default => 0
  end
end
