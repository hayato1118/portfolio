class AddLastNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :profile_image_id, :string
    add_column :users, :introduction, :string
    add_column :users, :phone_number1, :integer
    add_column :users, :phone_number2, :integer
    add_column :users, :phone_number3, :integer
    add_column :users, :github_id, :string
  end
end
