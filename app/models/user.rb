class User < ApplicationRecord
    has_many :convertedfiles

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true, uniqueness: true, length: {minimum: 4}
    validates :password, presence: true, length: {minimum: 8}
end
