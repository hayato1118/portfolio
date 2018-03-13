class AddOrderPointToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :order_point, :integer, :default => 0
  end
end
