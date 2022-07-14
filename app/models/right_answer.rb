class RightAnswer < ApplicationRecord
  has_many :questions

  validates :answer, presence: true, uniqueness: true
end
