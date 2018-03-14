class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


attachment :image
attachment :profile_image
has_many :product_comments, dependent: :destroy
has_many :orders
has_one :cart



# ユーザー　1:N 商品の関係
has_many :products
# has_many :buying_products, class_name: "Product", foreign_key: "buyer_id"

# =============================お気に入り機能==========ユーザー１:N商品の関係==========================

has_many :favorites
# ここはどうする？お気に入りが機能しなくなった。！
has_many :favorite_products, through: :favorites, source: :product
# has_many :favorite_products, through: :favorites, :class_name => 'Product'


# =============================お気に入り機能==========ユーザー１:N商品の関係=========================
#=====================================いいね機能==================================================

has_many :products, dependent: :destroy
has_many :product_goods, dependent: :destroy
has_many :product_good_posts, through: :product_goods, source: :product

#=====================================いいね機能==================================================
#=====================================フォロー機能==================================================

has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
has_many :followings, through: :following_relationships

has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
has_many :followers, through: :follower_relationships

#=====================================フォロー機能==================================================

#=====================================ユーザーに対してコメント機能==================================================

has_many :from_user_mypagecomments, foreign_key: "to_user_id", class_name: "MypageComment", dependent: :destroy
# has_many :from_users, through: :from_user_mypagecomments

has_many :to_user_mypagecomments, foreign_key: "from_user_id", class_name: "MypageComment", dependent: :destroy
# has_many :to_users, through: :to_user_mypagecomments

#=====================================ユーザーに対してコメント機能==================================================

validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }


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


def already_liked?(product)
    self.product_goods.exists?(product_id: product.id)
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
      .or User.where(['id LIKE ?', "%#{search}%"])
    else
      User.all #全て表示。
    end
  end

end





