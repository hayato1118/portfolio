class AddUsedPointToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :used_point, :integer, :default => 0
  end
end
