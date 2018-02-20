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


has_many :products


# ここはどうする？お気に入りが機能しなくなった。！
has_many :products, through: :favorites
# has_many :products, through: :favorites, :class_name => 'Product_favorites'



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


def soft_delete
    update(deleted_at: Time.now)
end

def active_for_authentication?
  !deleted_at
end

def inactive_message
  !deleted_at ? super : :deleted_account
end

 def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      User.where(['first_name LIKE ?', "%#{search}%"])
      .or User.where(['first_name_kana LIKE ?', "%#{search}%"])
      .or User.where(['last_name LIKE ?', "%#{search}%"])
      .or User.where(['last_name_kana LIKE ?', "%#{search}%"])
      .or User.where(['phone_number1 LIKE ?', "%#{search}%"])
      .or User.where(['phone_number2 LIKE ?', "%#{search}%"])
      .or User.where(['phone_number3 LIKE ?', "%#{search}%"])
      .or User.where(['state LIKE ?', "%#{search}%"])
      .or User.where(['city LIKE ?', "%#{search}%"])
      .or User.where(['street LIKE ?', "%#{search}%"])
      .or User.where(['zip LIKE ?', "%#{search}%"])
      .or User.where(['email LIKE ?', "%#{search}%"])
      .or User.where(['nickname LIKE ?', "%#{search}%"])
    else
      User.all #全て表示。
    end
  end

end

# 多対多の実装時
#ユーザーにいいね
#has_many :user_goods
#ユーザーにコメント
#has_many :mypage_comments

