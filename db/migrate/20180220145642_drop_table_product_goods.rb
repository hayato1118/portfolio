class DropTableProductGoods < ActiveRecord::Migration[5.1]
  def change
  	drop_table :product_goods
  end
end
