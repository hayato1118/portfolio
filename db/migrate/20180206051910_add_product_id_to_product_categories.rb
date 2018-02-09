class AddProductIdToProductCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :product_categories, :product_id, :integer
  end
end
