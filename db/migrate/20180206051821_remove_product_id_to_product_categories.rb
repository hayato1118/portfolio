class RemoveProductIdToProductCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_categories, :Product_id, :integer
  end
end
