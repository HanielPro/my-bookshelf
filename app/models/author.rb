class Author < ApplicationRecord
  has_many :publications, dependent: :destroy, inverse_of: :author # Adicionado dependent: :destroy e inverse_of
  has_many :books, through: :publications

  # New direct association to books
  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors

  validates :name, presence: true
  validates :birthdate, presence: true
end
