class User < ApplicationRecord
    validates :name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true
    has_one :diet
    has_many :weight_history
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
