class CreateMypageComments < ActiveRecord::Migration[5.1]
  def change
    create_table :mypage_comments do |t|
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
