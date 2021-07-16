class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :country

  validates :title, :category, :year, :rating, :price, :country_id, presence: :true
  
  scope :alpha_wine, -> {order(:title)}

end
