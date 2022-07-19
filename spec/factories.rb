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
    category_id { Category.find_or_create_by(name: 'category').id }
    right_answer_id { RightAnswer.find_or_create_by(answer: 'answer').id }
  end
end
