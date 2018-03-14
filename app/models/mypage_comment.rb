class MypageComment < ApplicationRecord
belongs_to :to_user, class_name: "User"
validates :to_user_id, presence: true

belongs_to :from_user, class_name: "User"
validates :from_user_id, presence: true


validates :comment, presence: true

end
