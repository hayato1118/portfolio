class AddAdminIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :admin_id, :integer
  end
end
