class AddPhoneNumber3ToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number3, :string
  end
end
