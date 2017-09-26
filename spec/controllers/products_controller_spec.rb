require 'rails_helper'

describe ProductsController, type: :controller do

  context 'GET #index' do
    before do
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success         # or to be_ok
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  context 'POST #create' do
    it 'is an invalid product' do
    @product = FactoryGirl.build(:product, name: "")
    expect(@product).not_to be_valid
    end
  end

  context 'GET #show' do
    it 'renders the show page' do
      product = FactoryGirl.create(:product)
      get :show, id: product.id
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context "DELETE #destroy" do
    before do
      @user = FactoryGirl.build(:admin)
      sign_in @user
    end

    it "should allow admin to delete product" do
      product = FactoryGirl.create(:product)
      delete :destroy, id: product.id
      expect(response).to redirect_to products_path
    end
  end

end
