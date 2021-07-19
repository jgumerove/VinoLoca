class Wine < ApplicationRecord
  belongs_to :user
  belongs_to :country
  validates :title, :category, :year, :rating, :price, :country_id, presence: :true
  validates :price, numericality: {greater_than_or_equal_to: 1}
  validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :year, numericality: {greater_than_or_equal_to: 1800, less_than_or_equal_to: Date.today.year}
  
  scope :alpha_wine, -> {order(:title)}

    def separate_comma
      a = self.price.to_s.split('')
      b = a.size/3.0
       if a.size < 4
        self.price.to_s 
      elsif a.size%3 == 0
        n = -4
       (b.to_i-1).times do |i|
        a.insert(n, ',')
        n -= 4
    end
       a.join("")
    else
        n = -4
        b.to_i.times do |i|
        a.insert(n, ',')
        n -= 4
    end
        a.join("")
    end
  end


end
