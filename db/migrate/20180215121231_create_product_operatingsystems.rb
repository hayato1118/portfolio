class CreateProductOperatingsystems < ActiveRecord::Migration[5.1]
  def change
    create_table :product_operatingsystems do |t|
      t.integer :operatingsystem_version_id
      t.integer :product_id

      t.timestamps
    end
  end
end
