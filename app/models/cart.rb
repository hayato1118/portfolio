class Cart < ApplicationRecord
	has_many :product_carts, :dependent => :destroy
	belongs_to :user
end
