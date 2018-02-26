class Order < ApplicationRecord
	has_many :product_orders , :dependent => :destroy
	# has_many :product, through: :product_orders
	belongs_to :user
	belongs_to :admin, optional: true
end
