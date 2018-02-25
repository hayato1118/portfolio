class ProductCart < ApplicationRecord
	belongs_to :product
	belongs_to :cart

	# def product_by?(product_item,cart)
	# 	product_cart.where(product_id: product_item).and self.where(cart_id: cart).exists?
	# end

	validates :product_id,:uniqueness => {:scope =>:cart_id }
	# validates :product_id, uniqueness: true
	# validates :cart_id, uniqueness: true
	# validates :product_by?, uniqueness: true


end

