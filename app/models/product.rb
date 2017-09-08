class Product < ActiveRecord::Base
  has_many :orders
  
  def self.search(search_term)
    like_operator = Rails.env.production? ? "ilike" : "LIKE"
		Product.where("name #{like_operator} ?", "%#{search_term}%")
  end   # search box


end
