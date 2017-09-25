require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(first_name: "Ben", last_name:"Jones", email: "benjones987@hotmail.com", password: "123456") }

    before do
      @comment1 = product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      @comment2 = product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      @comment3 = product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "has lowest rated comment" do
      expect(@comment1).to eq(product.lowest_rating_comment)
      # expect(product.lowest_rating_comment.rating).to eq 1
    end

    it "has a highest rated comment" do
      expect(@comment3).to eq(product.highest_rating_comment)
      # xpect(product.highest_rating_comment.rating).to eq 5
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end
  end

end
