class Purchase < ApplicationRecord
  belong_to :item
  belong_to :user
  validates :item, presence: true
  validates :user, presence: true
end
