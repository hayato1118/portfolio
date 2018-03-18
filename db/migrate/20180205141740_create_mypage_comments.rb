class CreateMypageComments < ActiveRecord::Migration[5.1]
  def change
    create_table :mypage_comments do |t|
      t.integer :user_id
      t.text :comment
	  t.integer :to_user_id
	  t.integer :from_user_id
      t.timestamps
    end
  end
end



