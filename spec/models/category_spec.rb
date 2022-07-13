require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.name = 'o' * 6
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid with a name too short' do
    subject.name = 'o' * 5
    expect(subject).to_not be_valid
  end
  it 'is not valid with a name too long' do
    subject.name = 'o' * 81
    expect(subject).to_not be_valid
  end
  it 'is not valid if name is already taken' do
    subject.name = 'o' * 6
    subject.save
    subject2 = subject.dup
    expect(subject2).to_not be_valid
  end
end
