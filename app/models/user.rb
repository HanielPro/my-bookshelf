class User < ApplicationRecord
  has_many :rentals
  has_many :books, through: :rentals

  validates :email, :name, :registration, :password, presence: true
  validates :email, :registration, uniqueness: true
end
