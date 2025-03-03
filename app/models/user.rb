class User < ApplicationRecord
  has_many :rentals
  has_many :books, through: :rentals

  validates :email, :name, :role, :password, presence: true
  validates :email, :role, uniqueness: true
end
