class CreateUsersGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :users_goods do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
