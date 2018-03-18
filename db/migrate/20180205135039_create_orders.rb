class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :phone_number1
      t.string :phone_number2
      t.string :phone_number3
      t.string :last_name
      t.string :last_name_kana
      t.string :first_name
      t.string :first_name_kana
      t.string :email
      t.integer :admin_id
      t.string :state
      t.string :zip
      t.string :city
      t.string :street
      t.integer :get_point, default: 0
      t.integer :used_point, default: 0
      t.timestamps
    end
  end
end

