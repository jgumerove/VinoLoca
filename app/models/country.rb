class Country < ApplicationRecord
    has_many :wines
    has_many :users, through: :wines
    validates :name, presence: :true

    scope :alpha_country, -> {order(:name)}
    

end
