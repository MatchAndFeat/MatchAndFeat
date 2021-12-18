# spec/features/visitor_signs_up_spec.rb
require 'rails_helper'

RSpec.feature 'User can create a project' do
  scenario 'with valid title and description' do
    sign_up_with Faker::Internet.email, Faker::Internet.password
    visit new_project_path
    fill_in 'project[title]', with: "Test with Capybara :)"
    fill_in 'project[description]', with: "Amazing Description"
    click_button "Envoyer"
    expect(page).to have_content('Ton projet a bien été publié !')
  end

  def sign_up_with(email, password)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_button "S'inscrire"
  end
end