class Product < ApplicationRecord
#カウンティング用
is_impressionable

has_many :product_carts, :dependent => :destroy
has_many :product_orders
has_many :product_comments, dependent: :destroy
has_many :product_goods
has_many :tags
accepts_nested_attributes_for :tags, allow_destroy: true
belongs_to :user

has_many :product_categories
has_many :categories, through: :product_categories
attachment :image
has_many :product_operatingsystems
# has_many :orders, through: :product_orders

  def soft_delete
    update(deleted_at: Time.now)
  end

  def is_new
    (2.days.ago..Time.current).cover?(Time.parse(self.created_at.to_s))
  end


 def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Product.where(['price LIKE ?', "%#{search}%"]).or Product.where(['title LIKE ?', "%#{search}%"])
    else
      Product.all #全て表示。
    end
  end

end
