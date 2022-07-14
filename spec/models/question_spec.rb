require 'rails_helper'

RSpec.describe Question, type: :model do
  subject do
    category = Category.create(name: Faker::Internet.username(specifier: 6..80))
    right_answer = RightAnswer.create(answer: Faker::Lorem.word)
    described_class.new(
      question: Faker::Lorem.question,
      difficulty: Random.new.rand(1..5),
      category_id: category.id,
      right_answer_id: right_answer.id
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without question' do
    subject.question = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if question is already taken' do
    subject2 = subject.dup
    subject.save
    expect(subject2).to_not be_valid
  end

  it 'is not valid without difficulty' do
    subject.difficulty = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with negative difficulty' do
    subject.difficulty = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid if difficulty is too high' do
    subject.difficulty = 6
    expect(subject).to_not be_valid
  end

  it 'is not valid without a category id' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a right_answer_id' do
    subject.right_answer_id = nil
    expect(subject).to_not be_valid
  end
end
