class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :destroy]
  before_action :user_check, only: [:destroy]

  def index
    @item = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    return if @item.user == current_user

    redirect_to root_path
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
      redirect_to root_path
    end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :condition_description_id, :category_id, :shipping_day_id,
                                 :prefecture_id, :shipping_prise_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_check
    unless @item.user == current_user
      redirect_to root_path
    end
  end
end
