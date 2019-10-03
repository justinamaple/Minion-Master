class Inventory < ApplicationRecord
  belongs_to :account
  validates :account_id, presence: true
  validates_uniqueness_of :account_id
end
