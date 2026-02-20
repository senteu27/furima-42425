class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to rootpath
    else
      render :new, status: :unprocessable_entity
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :condition_description_id, :category_id, :shipping_day_id, :prefecture_id, :shipping_prise_id)
  end
end
