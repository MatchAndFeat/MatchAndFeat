FactoryBot.define do
  factory :project do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    user { FactoryBot.create(:user) }
  end
end