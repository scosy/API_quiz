FactoryBot.define do
  factory :category do
    name { Faker::Lorem.characters(number: 10, min_alpha: 10) }
  end

  factory :right_answer do
    sequence(:answer) { |n| "#{Faker::Lorem.word}#{n}" }
  end

  factory :question do
    sequence(:question) { |n| "#{Faker::Lorem.question}#{n}" }
    difficulty { 1 }
    category_id { FactoryBot.create(:category).id }
    right_answer_id { FactoryBot.create(:right_answer).id }
  end

  factory :wrong_answer do
    sequence(:answer) { |n| "#{Faker::Lorem.word}#{n}" }
    question_id { FactoryBot.create(:question).id }
  end

  factory :user do
    sequence(:username) { Faker::Internet.username(specifier: 5..50) }
    sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
    password_digest { 'HHd8o$*6v@9akS' }
  end
end
