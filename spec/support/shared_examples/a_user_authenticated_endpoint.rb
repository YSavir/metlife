RSpec.shared_examples "a_user_authenticated_endpoint" do
  describe 'When the user is not signed in' do
    it 'should redirect to the root path' do
      action.call

      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'When the user is signed in' do
    it 'should return a 200' do
      sign_in(user)

      action.call

      expect(response).to have_http_status(200)
    end
  end

  def user
    @user ||= create :user, email: 'testing@place.com'
  end
end
