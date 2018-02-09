class RemovePhoneNumber1FromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :phone_number1, :integer
  end
end
