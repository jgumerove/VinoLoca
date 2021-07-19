class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :country
  validates :title, :category, :year, :rating, :price, :country_id, presence: :true
  validates :price, numericality: {greater_than_or_equal_to: 1}
  validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :year, numericality: {greater_than_or_equal_to: 1800, less_than_or_equal_to: Date.today.year}
  
  scope :alpha_wine, -> {order(:title)}

end
