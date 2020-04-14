require 'rails_helper'

RSpec.describe 'Sign Up', type: :system do
  context 'when new user is sign up' do
    it 'user sign up with valid data' do
      visit new_user_registration_path
      fill_in 'inputEmail', with: 'email@com.ua'
      fill_in 'inputPassword', with: '123456'
      fill_in 'passwordConfirmation', with: '123456'
      click_button 'Sign up'
      expect(page).to have_content('Logged in as email@com.ua.')
    end

    it 'user can not sign up with invalid data' do
      visit new_user_registration_path
      fill_in 'inputEmail', with: ' '
      fill_in 'inputPassword', with: '111'
      fill_in 'passwordConfirmation', with: '111'
      click_button 'Sign up'
      expect(page).to have_content('Email can\'t be blank')
      expect(page).to have_content('Password is too short')
    end
  end
end
