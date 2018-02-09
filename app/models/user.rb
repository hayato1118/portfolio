class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


has_many :product_comments, dependent: :destroy
has_many :products
has_many :product_goods
has_one :cart
has_many :orders
attachment :image
attachment :profile_image

# 多対多の実装時
#ユーザーにいいね
#has_many :user_goods
#ユーザーにコメント
#has_many :mypage_comments
end
