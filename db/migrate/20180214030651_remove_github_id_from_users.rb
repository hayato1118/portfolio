class RemoveGithubIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :github_id, :string
  end
end
