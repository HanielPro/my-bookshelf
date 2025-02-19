class Genre < ApplicationRecord
  has_many :publications
  has_many :books, through: publications
end
