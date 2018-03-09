class AddFromUserIdToMypageComments < ActiveRecord::Migration[5.1]
  def change
    add_column :mypage_comments, :from_user_id, :integer
  end
end
