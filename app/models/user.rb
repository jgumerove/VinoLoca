class User < ApplicationRecord
    has_secure_password
    has_many :wines
    has_many :countries, through: :wines
    validates :username, :email, uniqueness: true
    validates :username, :email, presence: true
end
