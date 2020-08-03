class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :item, presence: true
  validates :user, presence: true
end
