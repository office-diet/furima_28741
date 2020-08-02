class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :postage, :shipment_delay, :prefecture
  
  with_options presence: true do
    validates :name, :text, :user_id, :price
    validates :price_range_valid?
    validates :category_id, :condition_id, :postage_id, :shipment_delay_id, :prefecture_id,  numericality: { other_than: 0 }
  end

  private 

  def price_range_valid?
    if price < 300 || price > 9999999
      errors.add(:price, 'range invalid')
    end
  end
end
