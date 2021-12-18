require 'rails_helper'

RSpec.describe Feat, type: :model do

  before(:each) do 
    @feat = FactoryBot.create(:feat)
  end

  it "has a valid factory" do
    expect(build(:feat)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@feat).to be_a(Feat)
    end

    describe "#title" do
      it { expect(@feat).to validate_presence_of(:title) }
      it { expect(@feat).to validate_length_of(:title).is_at_least(5) }
    end

    describe "#description" do
      it { expect(@feat).to validate_presence_of(:description) }
    end
  end

  context "associations" do

    describe "likes" do
      it { expect(@feat).to have_many(:likes) }
    end

    describe "user" do
      it { expect(@feat).to belong_to(:user) }
    end
  
    describe "project" do
      it { expect(@feat).to belong_to(:project) }
    end
  end
end