class Book < ApplicationRecord
  # Associations
  has_many :categories, dependent: :destroy  # Adicionado dependent: :destroy
  has_many :genres, through: :categories
  has_many :publications, dependent: :destroy, inverse_of: :book
  has_many :authors, through: :publications
  has_many :users, through: :rentals

  accepts_nested_attributes_for :publications, allow_destroy: true

  # New direct association to authors
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  accepts_nested_attributes_for :authors, allow_destroy: true, reject_if: :all_blank

  # Validations
  validates :title, :publisher, :quanty, :year_published, presence: true

  def available?
    quanty > 0
  end
end
