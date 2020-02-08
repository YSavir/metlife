require 'feature_helper'

RSpec.feature 'As a guess with an account' do
  scenario 'I should be able to sign up' do
    user = build :user

    visit '/users/sign_up'
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    click_button 'Sign up'

    expect(page).to have_text("You have signed up successfully")
  end
end
