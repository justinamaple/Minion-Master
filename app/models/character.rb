class Character < ApplicationRecord
  belongs_to :account
  has_one :equipment

  validates :name, presence: true
  validates :name, uniqueness: { scope: :account }
  validates :race, presence: true
  validates :gender, presence: true
end
