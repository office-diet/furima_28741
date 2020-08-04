class Delivery < ApplicationRecord
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  TEL_REGEX = /\A\d{,11}\z/
  with_options presence: true do
    validates :town, :adress, :item_id
    validates :postal_code, format: { with: POSTAL_CODE_REGEX, message: 'input format 000-0000' }
    validates :prefecture_id, numericality: { less_than: Prefecture.count, message: 'valid' }
    validates :tel, format: { with: TEL_REGEX, message: 'numeric only max length 11' }

  end
end
