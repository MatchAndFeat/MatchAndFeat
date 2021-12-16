FactoryBot.define do
  factory :feat do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    user { FactoryBot.create(:user) }
    project { FactoryBot.create(:project) }
  end
end