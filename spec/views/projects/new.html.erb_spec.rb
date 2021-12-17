require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  it "displays 'Créer un nouveau projet'" do
    sign_in User.last
    @project = Project.new

    render

    expect(rendered).to have_content 'Créer un nouveau projet'
  end
  
end
