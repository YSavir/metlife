require 'feature_helper'

RSpec.feature 'As a signed-out user' do
  scenario 'I should be able to sign in' do
    user = create :user

    visit '/users/sign_in'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Log In'

    expect(page).to have_text("Welcome, #{user.name}")
  end
end
