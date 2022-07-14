require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      username: Faker::Internet.username(specifier: 5..50),
      email: Faker::Internet.email,
      password_digest: Faker::Internet.password(min_length: 8, max_length: 16, mix_case: true, special_characters: true)
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a username' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a username too short' do
    subject.username = 'o' * 4
    expect(subject).to_not be_valid
  end

  it 'is not valid with a username too long' do
    subject.username = 'o' * 51
    expect(subject).to_not be_valid
  end

  it 'is not valid if username is already taken' do
    subject.username = 'o' * 5
    subject.save
    subject2 = subject.dup
    expect(subject2).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with right email format' do
    valid_addresses = %w[email@rightformat.com user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      subject.email = valid_address
      expect(subject).to be_valid
    end
  end

  it 'is not valid with wrong email format' do
    invalid_addresses = %w[wrongemailformat/com user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      subject.email = invalid_address
      expect(subject).to_not be_valid
    end
  end

  it 'is not valid if email is already taken' do
    subject.email = 'email@rightformat.com'
    subject.save
    subject2 = subject.dup
    expect(subject2).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password_digest = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with wrong password format' do
    invalid_passwords = %w[Ph5SCWGcOveGgVm9 S5bR6^ BOAKLR3*D&2M$OM1 Batgli^VmMv
                           OMIJZEOIMJFZ4 #GWssCb0APxxt&2cl !3xhff5tin]
    invalid_passwords.each do |invalid_password|
      subject.password_digest = invalid_password
      expect(subject).to_not be_valid
    end
  end

  it 'is valid with right password format' do
    valid_passwords = %w[HHd8o$*6v@9akS ^CX5qhjKr p!gQr8r9DP nKzk3!$Tc1
                         23WK9Hy5!6CHLP NYewIx#X7$Pb1QgU]
    valid_passwords.each do |valid_password|
      subject.password_digest = valid_password
      expect(subject).to be_valid
    end
  end
end
