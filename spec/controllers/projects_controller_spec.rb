require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe "POST create" do
    context "with valid attributes" do
      it "creates a new project" do
        sign_in User.last
        expect { 
          post :create, params: { project: { title: "Title of test project", description: "Description of test project"} }
        }.to change(Project,:count).by(1)
      end
      
      it "redirects to the new project" do
        sign_in User.last
        post :create, params: { project: { title: "Title of test project", description: "Description of test project"} }
  
        # en général tu rediriges vers le show de ce que tu viens de créer
        response.should redirect_to Project.last
      end
    end
  end
end