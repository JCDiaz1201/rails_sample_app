class User < ApplicationRecord
    before_save {self.email = email.downcase}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name, presence: true, length: {maximum: 19}
    validates :email, presence: true, length: {maximum: 86}, format: { with: VALID_EMAIL_REGEX}, uniqueness: true

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
