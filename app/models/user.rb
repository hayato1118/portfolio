class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


has_many :product_comments, dependent: :destroy
has_many :product_goods
has_many :orders
has_one :cart

has_many :favorites
has_many :products, through: :favorites
# has_many :products
attachment :image
attachment :profile_image


has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
has_many :followings, through: :following_relationships

has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
has_many :followers, through: :follower_relationships
#user.rbにフォローする関数、フォローしているか調べるための関数、フォローを外す関数を作成
def following?(other_user)
following_relationships.find_by(following_id: other_user.id)
end

def follow!(other_user)
following_relationships.create!(following_id: other_user.id)
end

def unfollow!(other_user)
following_relationships.find_by(following_id: other_user.id).destroy
end

# 多対多の実装時
#ユーザーにいいね
#has_many :user_goods
#ユーザーにコメント
#has_many :mypage_comments
end
