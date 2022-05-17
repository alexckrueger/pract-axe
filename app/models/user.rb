class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :trainings 
  has_many :throws, through: :trainings
end
