class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id,:shipping_method_id, :ships_from_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
