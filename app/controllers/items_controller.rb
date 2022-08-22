class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit]

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

  def show

    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id,:shipping_method_id, :ships_from_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
