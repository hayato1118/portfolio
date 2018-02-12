class Product < ApplicationRecord
has_many :product_carts, :dependent => :destroy
has_many :product_orders
has_many :product_comments, dependent: :destroy
has_many :product_goods
has_many :tags
accepts_nested_attributes_for :tags, allow_destroy: true


has_many :product_categories
has_many :categories, through: :product_categories

# has_many :categories, dependent: :destroy

belongs_to :user
attachment :image
end
