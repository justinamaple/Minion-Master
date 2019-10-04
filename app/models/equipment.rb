class Equipment < ApplicationRecord
  belongs_to :character
  has_many :items, as: :inside

  validates :character_id, presence: true
  validates_uniqueness_of :character_id
end
