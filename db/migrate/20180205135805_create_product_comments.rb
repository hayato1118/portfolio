class CreateProductComments < ActiveRecord::Migration[5.1]
  def change
    create_table :product_comments do |t|
      t.integer :user_id
      t.integer :product_id
      t.text :comment

      t.timestamps
    end
  end
end
