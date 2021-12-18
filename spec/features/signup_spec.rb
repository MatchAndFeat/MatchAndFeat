require 'rails_helper'

RSpec.feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with Faker::Internet.email, Faker::Internet.password
    expect(page).to have_content('Se déconnecter')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'
    expect(page).to have_content("S'inscrire")
  end

  scenario 'with blank password' do
    sign_up_with Faker::Internet.email, ''
    expect(page).to have_content("S'inscrire")
  end

  def sign_up_with(email, password)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_button "S'inscrire"
  end
end