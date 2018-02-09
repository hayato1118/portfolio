class Product < ApplicationRecord
has_many :product_carts, :dependent => :destroy
has_many :product_orders
has_many :product_comments, dependent: :destroy
has_many :product_goods

has_many :product_tags
has_many :tags,through: :product_tags

has_many :product_categories
has_many :categories, through: :product_categories

has_many :categories, dependent: :destroy
accepts_nested_attributes_for :categories, allow_destroy: true

belongs_to :user
attachment :image
end
