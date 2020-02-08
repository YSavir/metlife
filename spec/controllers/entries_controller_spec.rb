require 'controller_helper'

RSpec.describe EntriesController, type: :controller do
  describe 'GET #index' do
    it_should_behave_like 'a_user_authenticated_endpoint' do
      def action 
        Proc.new { get :index }
      end
    end

    describe 'When the user is signed in' do
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

  describe 'GET #new' do
    it_should_behave_like 'a_user_authenticated_endpoint' do
      def action
        Proc.new { get :new }
      end
    end
  end
end
