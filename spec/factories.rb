FactoryBot.define do
  factory :category do
    name { Faker::Lorem.characters(number: 10, min_alpha: 10) }
  end
end
