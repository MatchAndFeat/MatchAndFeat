require 'rails_helper'

RSpec.describe Skill, type: :model do

  before(:each) do 
    @skill = FactoryBot.create(:skill)
  end

  it "has a valid factory" do
    expect(build(:skill)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@skill).to be_a(Skill)
    end

    describe "#name" do
      it { expect(@skill).to validate_presence_of(:name) }
    end

  end

  context "associations" do

    describe "user" do
      it { expect(@skill).to have_and_belong_to(:user) }
    end

    describe "project" do
      it { expect(@skill).to have_and_belong_to(:project) }
    end
  
  end

end