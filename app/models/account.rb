class Account < ApplicationRecord
  has_many :characters
  has_many :equipment, through: :characters
  has_one :inventory

  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
end
