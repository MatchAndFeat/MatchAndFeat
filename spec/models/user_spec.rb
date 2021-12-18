require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "#email" do
      it { expect(@user).to validate_presence_of(:email) }
    end

    describe "#password" do
      it { expect(@user).to validate_length_of(:password).is_at_least(6) }

    end

  end

  context "associations" do

    describe "projects" do
      it { expect(@user).to have_many(:projects) }
    end
    
    describe "feats" do
      it { expect(@user).to have_many(:feats) }
    end
    
    describe "likes" do
      it { expect(@user).to have_many(:likes) }
    end
    
    describe "skills" do
      it { expect(@user).to have_and_belong_to_many(:skills) }
    end
  
  end

end