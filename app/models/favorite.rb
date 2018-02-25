class Favorite < ApplicationRecord
belongs_to :user
# , class_name: "User"
belongs_to :product


validates :product_id,:uniqueness => {:scope =>:user_id }

end
