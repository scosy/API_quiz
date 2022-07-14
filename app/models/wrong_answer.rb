class WrongAnswer < ApplicationRecord
  belongs_to :question

  validates :answer, presence: true, uniqueness: true
end
