require 'rails_helper'

describe UsersController, type: :controller do

  # user = FactoryGirl.create(:user)
  # user2 = FactoryGirl.create(:user)
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  # let(:user) { User.create!(email: "hana9090@hotmail.com", password: "123456") }
  # let(:user2) { User.create!(email: "test9098@hotmail.com", password: "123456") }


  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end
      it 'loads correct user details' do
        get :show, id: user.id
        expect(assigns(:user)).to eq user
        expect(response).to have_http_status(200)
        # expect(response).to be_ok # the same as status 200
      end

      it 'cant access other users show page' do
        get :show, id: user2.id
        expect(response).to redirect_to(root_path)
        expect(response).to have_http_status(302)
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, id: user.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
