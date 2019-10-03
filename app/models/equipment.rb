class Equipment < ApplicationRecord
  belongs_to :character

  validates :character_id, presence: true
  validates_uniqueness_of :character_id
end
