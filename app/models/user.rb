class User < ApplicationRecord
  has_many :trainings 
  has_many :throws, through: :trainings
end
