class Order < ApplicationRecord
	has_many :product_orders , :dependent => :destroy
	# has_many :product, through: :product_orders
	belongs_to :user
	belongs_to :admin, optional: true



 def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Order.where(['first_name LIKE ?', "%#{search}%"])
      .or Order.where(['first_name_kana LIKE ?', "%#{search}%"])
      .or Order.where(['last_name LIKE ?', "%#{search}%"])
      .or Order.where(['last_name_kana LIKE ?', "%#{search}%"])
      .or Order.where(['phone_number1 LIKE ?', "%#{search}%"])
      .or Order.where(['phone_number2 LIKE ?', "%#{search}%"])
      .or Order.where(['phone_number3 LIKE ?', "%#{search}%"])
      .or Order.where(['state LIKE ?', "%#{search}%"])
      .or Order.where(['city LIKE ?', "%#{search}%"])
      .or Order.where(['street LIKE ?', "%#{search}%"])
      .or Order.where(['zip LIKE ?', "%#{search}%"])
      .or Order.where(['email LIKE ?', "%#{search}%"])
      .or Order.where(['id LIKE ?', "%#{search}%"])
    else
      Order.all #全て表示。
    end
  end
end
