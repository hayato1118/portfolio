class AddProductIdToProductTags < ActiveRecord::Migration[5.1]
  def change
    add_column :product_tags, :product_id, :integer
  end
end
