class RemoveDeletedAtFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :deleted_at, :datetime
  end
end
