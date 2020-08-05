class PurchasesController < ApplicationController
  before_action :set_item

  def index
    redirect_to new_user_session_path unless user_signed_in?
    if @item.user_id == current_user.id || @item.purchase.present?
      redirect_to root_path
    end

    @purchase = ItemPurchase.new
  end
  
  def create
    binding.pry
    @purchase = ItemPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit(:postal_code, :prefecture_id, :town, :address, :building, :tel, :item_id, :token ).merge(user_id: current_user.id).merge(price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECURITY_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
  
end
