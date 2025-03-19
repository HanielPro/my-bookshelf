class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable  # Adicione os módulos necessários

  # enum role: { user: "user", admin: "admin" }

  has_many :rentals
  has_many :books, through: :rentals

  validates :email, :name, :registration, presence: true
  validates :email, :registration, uniqueness: true

  before_create :set_default_role

  def set_default_role
    self.role ||= "user"
  end

  def admin?
    self.role ||= "admin"
  end
end
