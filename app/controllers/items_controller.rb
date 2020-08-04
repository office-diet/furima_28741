class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all.order(id: 'DESC').includes(:purchase)
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
      redirect_to item_path(@item.id)
    else
      render 'items/new'
    end
  end

  def edit
    if user_signed_in?
      if @item.user.id != current_user.id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render 'items/edit'
    end
  end

  def destroy
    if user_signed_in?
      if @item.user.id = current_user.id
        @item.destroy
      end
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :condition_id, :postage_id, :prefecture_id, :shipment_delay_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
