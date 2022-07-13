class Category < ApplicationRecord
  has_many :questions

  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 6, maximum: 80 }
end
