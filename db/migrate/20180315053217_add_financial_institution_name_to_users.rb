class AddFinancialInstitutionNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :financial_institution_name, :string
    add_column :users, :branch_name, :string
    add_column :users, :type_of_account, :string, :default => "普通口座"
    add_column :users, :account_number, :integer
    add_column :users, :account_holder_name, :string
  end
end

