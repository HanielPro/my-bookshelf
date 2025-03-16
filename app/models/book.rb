# This class represents a book in the application.#+
# It has many-to-many relationships with categories, genres, publications, authors, rentals, and users.#+
# It also validates the presence of certain attributes.#+
class Book < ApplicationRecord
  # Associations#+
  has_many :categories
  # Through association with categories to get genres#+
  has_many :genres, through: :categories
  has_many :publications
  # Through association with publications to get authors#+
  has_many :authors, through: :publications
  has_many :rentals
  # Through association with rentals to get users#+
  has_many :users, through: :rentals

  # Validations#+
  # Ensures that the title, publisher, quanty, and year_published attributes are present#+
  validates :title, :publisher, :quanty, :year_published, presence: true

  def available?
    quanty > 0
  end
end
