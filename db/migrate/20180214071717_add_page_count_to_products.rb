class AddPageCountToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :page_count, :string
  end
end
