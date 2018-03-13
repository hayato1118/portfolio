class RemoveGetPointFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :get_point, :integer
  end
end
