require 'rails_helper'

RSpec.describe WrongAnswer, type: :model do
  subject do
    category = Category.create(name: Faker::Internet.username(specifier: 6..80))
    right_answer = RightAnswer.create(answer: Faker::Lorem.word)
    question = Question.create(
      question: Faker::Lorem.question,
      difficulty: Random.new.rand(1..5),
      category_id: category.id,
      right_answer_id: right_answer.id
    )
    described_class.new(
      answer: Faker::Lorem.word,
      question_id: question.id
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without answer' do
    subject.answer = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if answer is already saved' do
    subject2 = subject.dup
    subject.save
    expect(subject2).to_not be_valid
  end
end
