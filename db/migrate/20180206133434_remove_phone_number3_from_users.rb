class RemovePhoneNumber3FromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :phone_number3, :integer
  end
end
