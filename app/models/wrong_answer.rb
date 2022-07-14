class WrongAnswer < ApplicationRecord
  has_many :wrong_answers
  has_many :categories, through: :wrong_answers

  validates :answer, presence: true, uniqueness: true
end
