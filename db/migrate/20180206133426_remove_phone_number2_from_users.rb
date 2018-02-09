class RemovePhoneNumber2FromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :phone_number2, :integer
  end
end
