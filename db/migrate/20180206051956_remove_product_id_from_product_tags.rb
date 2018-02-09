class RemoveProductIdFromProductTags < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_tags, :Product_id, :integer
  end
end
