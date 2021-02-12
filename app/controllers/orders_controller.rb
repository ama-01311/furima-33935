class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @item = Item.find(params[:item_id])
    @orders = Order.new
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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

  def order_params
    params.require(:order_address).permit(:delivery_post_number, :delivery_prefecture_id, :delivery_municipality, :delivery_building, :delivery_address, :delivery_prefecture_id, :phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.selling_price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
