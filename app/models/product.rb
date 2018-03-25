class Product < ApplicationRecord
#カウンティング用
is_impressionable
attachment :image

has_many :product_carts, :dependent => :destroy
has_many :product_orders
has_many :product_comments, :dependent => :destroy


# ユーザー　1:N 商品の関係
belongs_to :user
# belongs_to :buyer, class_name: "User", optional: true
# 管理者　1:N 商品の関係
belongs_to :admin, optional: true

#=====================================お気に入り機能==================================================

has_many :favorites
has_many :users, through: :favorites

#=====================================お気に入り機能==================================================

#=====================================いいね機能==================================================

has_many :product_goods
has_many :product_good_users, through: :product_goods, source: :user

#=====================================いいね機能==================================================
#=====================================無限タグ機能==================================================

has_many :tags
accepts_nested_attributes_for :tags, allow_destroy: true

#=====================================無限タグ機能==================================================

has_many :product_categories
has_many :categories, through: :product_categories


has_many :product_operatingsystems
# has_many :orders, through: :product_orders




validates :price, presence: true
validates :image, presence: true
validates :title, presence: true
validates :url, presence: true
validates :product_detail, presence: true




  def soft_delete
    update(deleted_at: Time.now)
  end

  def is_new
    (3.days.ago..Time.current).cover?(Time.parse(self.created_at.to_s))
  end




 def self.search(search) #self.でクラスメソッドとしている
    if search #\ Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      # Product.where(['price LIKE ?', "%#{search}%"])
      # .or Product.where(['title LIKE ?', "%#{search}%"])
      # .or Product.where(['product_detail LIKE ?', "%#{search}%"])
      # .or Product.where(['id LIKE ?', "%#{search}%"])



# Product.joins(:tags).where(['tag_name LIKE ?', "%#{search}%"]).first.attributes

      relation = Product.joins(:tags)
      # relation
      # .merge(Tag.where(['tag_name LIKE ?', "%#{search}%"]))

      relations = relation.joins(:categories)
      relations
      .merge(Category.where(['category_name LIKE ?', "%#{search}%"]))
      .or(relations.where(['tag_name LIKE ?', "%#{search}%"]))
      .or(relations.where(['price LIKE ?', "%#{search}%"]))
      .or(relations.where(['title LIKE ?', "%#{search}%"]))
      .or(relations.where(['product_detail LIKE ?', "%#{search}%"])).uniq
    else
      Product.all
    end
  end
end























