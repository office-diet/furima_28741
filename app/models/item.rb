class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipment_delay
  belongs_to_active_hash :prefecture
  
  with_options presence: true do
    validates :image, :name, :text, :user_id, :price
    validates :price_range_valid?
    validates :category_id, :condition_id, :postage_id, :shipment_delay_id, :prefecture_id,  numericality: { other_than: 0, message: 'You need to select' } 
  end

  private 

  def price_range_valid?
    input = price.to_i
    if input < 300 || input > 9999999
      errors.add(:price, 'range invalid')
    else
      return true
    end
  end
end
