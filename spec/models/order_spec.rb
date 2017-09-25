require 'rails_helper'

describe Order do
  before do
    @order = FactoryGirl.build(:order)
    @product = FactoryGirl.build(:product)
  end

  it "has a valid factory" do
    expect(@order).to be_valid
  end

  it "belongs to product" do
    @product.orders << @order
    expect(@order.product).to be @product
  end


end
