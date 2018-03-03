class RemoveBuyerIdFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :buyer_id, :integer
  end
end
