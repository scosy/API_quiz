class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true,
                       length: { minimum: 5, maximum: 50 }

  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  }

  validates :password, presence: true, format: {
    with: /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,16}$/,
    on: :create,
    multiline: true
  }
end
