require 'feature_helper'

RSpec.feature 'As a signed-out user' do
  scenario 'I should be able to sign in' do
    user = create :user

    visit '/users/sign_in'
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button 'Log in'

    expect(page).to have_text("Signed in successfully")
  end
end
