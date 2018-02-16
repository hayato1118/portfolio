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


  def is_new
    (3.days.ago..Time.current).cover?(Time.parse(self.created_at.to_s))
  end

end
