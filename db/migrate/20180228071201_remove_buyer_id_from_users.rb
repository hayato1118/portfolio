class RemoveBuyerIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :buyer_id, :integer
  end
end
