class ItemPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :town, :adress, :building, :tel

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  TEL_REGEX = /\A\d{,11}\z/
  with_options presence: true do
    validates :town, :adress, :item_id, :user_id
    validates :postal_code, format: { with: POSTAL_CODE_REGEX, message: 'input format 000-0000' }
    validates :prefecture_id, numericality: { less_than: Prefecture.count, message: 'valid' }
    validates :tel, format: { with: TEL_REGEX, message: 'numeric only max length 11' }
  end

  def save
    Purchase.create(user_id: current_user.id, item_id: item)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, town: town, address: adress, building: building, tel: tel, item_id: item_id)
  end
end