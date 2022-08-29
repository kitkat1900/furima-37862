class OrdersController < ApplicationController
  attr_accessor :token
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!,only: [:index, :create]
  before_action :redirect, only: [:index, :create]

  def index
    @order_shipping_address = OrderShippingAddress.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    PPayjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def redirect
    if current_user != @item.user && @item.order != nil
      redirect_to root_path
    end
  end
end