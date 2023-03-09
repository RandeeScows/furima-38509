class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :set_order, only: [:index, :create]
  before_action :validate_user, only: [:index, :create]

  def index
    if @item.order.present?
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private 
  def set_item
    @item = Item.find(params[:item_id])
    @order = Order.find(params[:order_id])
  end

  def order_params
    params.require(:order_address)
    .permit(:zip_code, :prefecture_id, :township, :block, :building, :tel)
    .merge(item_id: @item.id, user_id: current_user.id, order_id: @order.id, token: params[:token], price: @item[:price])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def validate_user
    if current_user.id == @item[:user_id]
      redirect_to root_path
    end
  end
end
