require 'rails_helper'
require 'ffaker'

RSpec.describe 'Sign In', type: :system do
  context 'when existing user is sign in' do
    let(:user) { create :user }
    it 'user sign in with valid data' do
      visit user_session_path
      fill_in 'inputEmail', with: user.email
      fill_in 'inputPassword', with: user.password
      click_button 'Log in'
      expect(page).to have_content("Logged in as #{user.email}.")
    end

    it 'user can not sign in with invalid data' do
      visit user_session_path
      fill_in 'inputEmail', with: FFaker::Internet.email
      fill_in 'inputPassword', with: FFaker::Internet.password
      click_button 'Log in'
      expect(page).to have_content('Log in')
    end
  end
end

