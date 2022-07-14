class Question < ApplicationRecord
  belongs_to :category
  belongs_to :right_answer
  has_many :wrong_answers

  validates :question, presence: true, uniqueness: true
  validates :difficulty, presence: true, inclusion: { in: [*1..5] }
end
