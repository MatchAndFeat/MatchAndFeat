require 'rails_helper'

RSpec.describe Project, type: :model do

  before(:each) do 
    @project = FactoryBot.create(:project)
  end

  it "has a valid factory" do
    expect(build(:project)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@project).to be_a(Project)
    end

    describe "#title" do
      it { expect(@project).to validate_presence_of(:title) }
      it { expect(@project).to validate_length_of(:title).is_at_least(5) }
    end

    describe "#description" do
      it { expect(@project).to validate_presence_of(:description) }
    end
  end

  context "associations" do

    describe "feats" do
      it { expect(@project).to have_many(:feats) }
    end

    describe "likes" do
      it { expect(@project).to have_many(:likes) }
    end
  
    describe "user" do
      it { expect(@project).to belong_to(:user) }
    end
  end
end