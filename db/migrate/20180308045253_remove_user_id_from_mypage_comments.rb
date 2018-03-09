class RemoveUserIdFromMypageComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :mypage_comments, :user_id, :integer
  end
end
