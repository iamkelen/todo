require 'rails_helper'
require 'ffaker'

RSpec.describe 'Sign Up', type: :system do
  context 'when new user is sign up' do
    let(:password) { FFaker::Internet.password(6) }
    it 'user sign up with valid data' do
      visit new_user_registration_path
      fill_in 'inputEmail', with: FFaker::Internet.email
      fill_in 'inputPassword', with: :password
      fill_in 'passwordConfirmation', with: :password
      click_button 'Sign up'
      expect(page).to have_content('Logged in as')
    end

    it 'user can not sign up with invalid data' do
      visit new_user_registration_path
      fill_in 'inputEmail', with: 'Blah Blah Blah'
      fill_in 'inputPassword', with: '111'
      click_button 'Sign up'
      expect(page).to have_content('Sign up')
    end
  end
end
