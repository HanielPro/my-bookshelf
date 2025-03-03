class Book < ApplicationRecord
  has_many :categories
  has_many :genres, through: :categories
  has_many :publications
  has_many :authors, through: :publications
  has_many :rentals
  has_many :users, through: :rentals

  validates :title, :publisher, :quanty, year_published, presence: true
end
