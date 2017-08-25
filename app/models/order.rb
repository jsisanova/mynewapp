# class Order < ApplicationRecord
#   belongs_to :product
# end

class Order  < ActiveRecord::Base
  belongs_to :product
end
