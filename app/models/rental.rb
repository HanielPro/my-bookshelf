class Rental < ApplicationRecord
  belongs_to :user #Aqui deveria ser has_many, não?
  belongs_to :book #Aqui deveria ser has_many, não?
end
