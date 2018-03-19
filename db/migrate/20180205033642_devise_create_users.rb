# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :nickname
      t.string :name
      t.string :last_name
      t.string :last_name_kana
      t.string :first_name
      t.string :first_name_kana
      t.string :profile_image_id
      t.string :introduction
      t.string :state
      t.string :city
      t.string :street
      t.string :zip
      t.string :phone_number1
      t.string :phone_number2
      t.string :phone_number3
      t.string :image_id
      t.string :twitter_id
      t.string :facebook_id
      t.string :instagram_id
      t.string :financial_institution_name
      t.string :branch_name
      t.string :type_of_account, default: "普通口座"
      t.string :account_holder_name
      t.integer :account_number
      t.integer :point, default: 0
      t.datetime :deleted_at






      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
