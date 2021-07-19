class User < ApplicationRecord
    has_secure_password
    has_many :wines
    has_many :countries, through: :wines
    validates :username, :email, uniqueness: true
    validates :username, :email, presence: true
    validates :password, length: { in: 6..20 }

    def self.find_or_create_from_google(user_info)
        find_or_create_by(email: user_info[:email]) do |user|
            user.username = user_info[:name]
            user.password = SecureRandom.hex
        end
    end
end
