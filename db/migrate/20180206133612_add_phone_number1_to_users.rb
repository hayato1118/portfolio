class AddPhoneNumber1ToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number1, :string
  end
end
