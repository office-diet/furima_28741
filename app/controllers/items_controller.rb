class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'items/new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :condition_id, :postage_id, :prefecture_id, :shipment_delay_id).merge(user_id: current_user.id)
  end
end
