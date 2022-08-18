class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id,:shipping_method_id, :ships_from_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
