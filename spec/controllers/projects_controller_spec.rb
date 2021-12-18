require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  
  before(:each) do 
    @user = FactoryBot.create(:user)
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new project" do
        sign_in @user
        expect { 
          post :create, params: { project: { title: "Title of test project", description: "Description of test project"} }
        }.to change(Project,:count).by(1)
      end
      
      it "redirects to the new project" do
        sign_in @user
        post :create, params: { project: { title: "Title of test project", description: "Description of test project"} }
        response.should redirect_to Project.last
      end
    end
  end
end