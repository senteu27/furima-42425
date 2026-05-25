class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :municipalities,:street_address, :building_name,:telephone_number).merge(user_id: current_user.id, item_id: (@item.id) )
  end
end
