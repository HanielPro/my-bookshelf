class Author < ApplicationRecord
  has_many :publications
  has_many :books, through: :publications

  validates :name, presence: true
  validates :date_of_birth, presence: true
end
