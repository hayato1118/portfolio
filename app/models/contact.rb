class Contact < ApplicationRecord

  validates :email, uniqueness: false # 値がユニークであれば検証成功
validates :name, uniqueness: false
validates :nick_name, uniqueness: false
validates :phone, uniqueness: false
validates :status, uniqueness: false
validates :first_name, uniqueness: false
validates :message, uniqueness: false
validates :id, uniqueness: false
 def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Contact.where(['first_name LIKE ?', "%#{search}%"])
      .or Contact.where(['name LIKE ?', "%#{search}%"])
      .or Contact.where(['nick_name LIKE ?', "%#{search}%"])
      .or Contact.where(['phone LIKE ?', "%#{search}%"])
      .or Contact.where(['status LIKE ?', "%#{search}%"])
      .or Contact.where(['email LIKE ?', "%#{search}%"])
      .or Contact.where(['id LIKE ?', "%#{search}%"])
      .or Contact.where(['message LIKE ?', "%#{search}%"])
    else
      Contact.all #全て表示。
    end
  end
end