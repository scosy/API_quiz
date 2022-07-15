FactoryBot.define do
  factory :category do
    name { Faker::Lorem.characters(number: 10, min_alpha: 10) }
  end

  factory :right_answer do
    sequence(:answer) { |n| "Faker::Lorem.word#{n}" }
  end
end
