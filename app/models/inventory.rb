class Inventory < ApplicationRecord
  belongs_to :account
  has_many :items, as: :inside

  validates :account_id, presence: true
  validates_uniqueness_of :account_id
end
