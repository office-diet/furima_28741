class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = ItemPurchase.new
  end
  
  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @purchase = ItemPurchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:postal_code, :prefecture_id, :town, :address, :building, :tel, :item_id ).merge(user_id: current_user.id)
  end

end
