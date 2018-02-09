class AddPhoneNumber2ToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number2, :string
  end
end
