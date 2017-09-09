class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments

  validates :name, presence: true

  def self.search(search_term)
    like_operator = Rails.env.production? ? "ilike" : "LIKE"
		Product.where("name #{like_operator} ?", "%#{search_term}%")
  end   # search box


  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
    # or comments.order(:rating)
  end

  def average_rating
  comments.average(:rating).to_f
  end
end
