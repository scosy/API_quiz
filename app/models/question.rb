class Question < ApplicationRecord
  belongs_to :category

  validates :question, presence: true, uniqueness: true
  validates :difficulty, presence: true, inclusion: { in: [*1..5] }
end
