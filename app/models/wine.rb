class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :country
  
  scope :alpha_wine, -> {order(:title)}

end
