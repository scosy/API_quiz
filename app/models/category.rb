class Category < ApplicationRecord
  has_many :questions
  has_many :wrong_answers, through: :questions

  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 6, maximum: 80 }
end
