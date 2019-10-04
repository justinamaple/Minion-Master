class Item < ApplicationRecord
  belongs_to :inside, polymorphic: true

  validates :inside_id, presence: true
  validates :inside_type, presence: true
end
