FactoryBot.define do
  factory :like do
    user { FactoryBot.create(:user) }
    likeable { FactoryBot.create(:project) }
  end
end