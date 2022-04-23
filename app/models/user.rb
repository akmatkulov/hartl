class User < ApplicationRecord
    # гарантия уникальности артибута email за счет перевода в нижний регистр
    before_save { self.email.downcase! }
  
    # проверка наличия
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }
    
    # проверка допустимого формата email
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    # проверка уникальности email, нечувствительная к регистру
    validates :email, uniqueness: { case_sensitive: false }

    has_secure_password
    # минимальная длина пароля
    validates :password, length: { minimum: 6 }
   

end
