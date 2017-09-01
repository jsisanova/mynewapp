class Product < ActiveRecord::Base

  def self.search(search_term)
    like_operator = Rails.env.production? ? "ilike" : "LIKE"
		Product.where("name #{like_operator} ?", "%#{search_term}%")
  end   # search box


end
