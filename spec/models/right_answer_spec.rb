require 'rails_helper'

RSpec.describe RightAnswer, type: :model do
  subject { described_class.new(answer: Faker::Lorem.word) }

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
