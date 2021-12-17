require 'rails_helper'

RSpec.describe Like, type: :model do

  before(:each) do 
    @like = FactoryBot.create(:like)
  end

  it "has a valid factory" do
    expect(build(:like)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@like).to be_a(Like)
    end

  end

  context "associations" do

    describe "user" do
      it { expect(@like).to belong_to(:user) }
    end

    describe "likeable" do
      it { expect(@like).to belong_to(:likeable) }
    end
  
  end

end