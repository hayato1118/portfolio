class Favorite < ApplicationRecord

#=====================================お気に入り機能==================================================
belongs_to :user
# , class_name: "User"
belongs_to :product

#=====================================いいね機能==================================================

validates :product_id,:uniqueness => {:scope =>:user_id }

end
