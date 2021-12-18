require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  
  before(:each) do 
    @user = FactoryBot.create(:user)
  end

  it "displays 'Créer un nouveau projet'" do
    sign_in @user
    @project = Project.new
    render
    expect(rendered).to have_content 'Créer un nouveau projet'
  end
end
