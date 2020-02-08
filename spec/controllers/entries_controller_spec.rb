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

    describe 'When the user is signed in' do
      it 'should assign a blank entry' do
        user = create :user

        sign_in(user)
        get :new

        expect(assigns(:entry).attributes).to eq Entry.new.attributes
      end
    end
  end

  describe 'POST #create' do
    it_should_behave_like 'a_user_authenticated_endpoint' do
      def success_status
        302
      end
    end

    describe 'When the user is signed in' do
      it 'should create a new post with the given title and body' do
        user = create :user

        expect {
          sign_in(user)
          action.call
        }.to change { Entry.count } .by(1)

        expect(Entry.last).to have_attributes(
          title: new_entry_details['title'],
          body: new_entry_details['body']
        )
      end

      it 'should set the created post to the current user' do
        user = create :user

        sign_in(user)
        action.call

        expect(Entry.last.user).to eq(user)
      end

      it 'should set the posted_at to the current time' do
        Timecop.freeze do
          user = create :user

          sign_in(user)
          action.call

          expect(Entry.last.posted_at).to eq(Time.current)
        end
      end

      it 'should redirect to the new posts page' do
        user = create :user

        sign_in(user)
        action.call

        expect(response).to redirect_to entries_path(Entry.last)
      end
    end

    def action
      Proc.new do
        post :create, params: {
          title: new_entry_details['title'],
          body: new_entry_details['body']
        }
      end
    end

    def new_entry_details
      @new_entry_details ||= build(:entry).attributes
    end
  end
end
