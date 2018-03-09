class AddToUserIdToMypageComments < ActiveRecord::Migration[5.1]
  def change
    add_column :mypage_comments, :to_user_id, :integer
  end
end
