require 'controller_helper'

RSpec.describe EntriesController, type: :controller do
  describe 'GET #index' do
    describe 'When the user is not signed in' do
      it 'should redirect to the root path' do
        get :index

        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'When the user is signed in' do
      it 'should return a 200' do
        user = create :user

        sign_in(user)

        get :index

        expect(response).to have_http_status(200)
      end

      it 'should assign the user entries' do
        user = create :user
        user_entries = create_list :entry, 2, user: user
        non_user_entries = create_list :entry, 2

        sign_in(user)

        get :index
        
        expect(assigns(:user_entries)).to eq user_entries
      end
    end
  end
end
