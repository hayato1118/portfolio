class Contact < ApplicationRecord


validates :message, presence: true
# validates :name_or_nick_name, presence: true
validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
validates :phone, presence: true


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


  private
    def name_or_nick_name
      name.presence or nick_name.presence
    end
end


